import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:sha/models/form/form_topup_model.dart';
import 'package:sha/models/payment_method_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/pages/topup/topup_amount_page.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_card.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return _WalletSection(
                  walletNumber: state.user.cardNumber!.replaceAllMapped(
                    RegExp(r".{4}"),
                    (match) => "${match.group(0)} ",
                  ),
                  walletName: '${state.user.name}',
                );
              }
              return Container();
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Select Bank',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocConsumer<PaymentMethodBloc, PaymentMethodState>(
              listener: (context, state) {
                if (state is PaymentMethodFailed) {
                  showCustomSnackbar(context, state.e);
                }
              },
              builder: (context, state) {
                if (state is PaymentMethodLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kBlackColor,
                    ),
                  );
                }

                if (state is PaymentMethodSuccess) {
                  return Column(
                      children: state.paymentMethods
                          .map((paymentMethod) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPaymentMethod = paymentMethod;
                                  });
                                },
                                child: ShaCard(
                                  paymentMethod: paymentMethod,
                                  isSelected: (paymentMethod.id ==
                                      selectedPaymentMethod?.id),
                                ),
                              ))
                          .toList());
                }

                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: ShaButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopupAmountPage(
                        data: FormTopupModel(
                          paymentMethodCode: selectedPaymentMethod?.code,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _WalletSection extends StatelessWidget {
  final String walletNumber;
  final String walletName;
  const _WalletSection({
    required this.walletNumber,
    required this.walletName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Wallet',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 55,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/img_wallet_small.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    walletNumber,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    walletName,
                    style: greyTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
