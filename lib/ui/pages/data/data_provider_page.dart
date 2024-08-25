import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/blocs/operator_card/operator_card_bloc.dart';
import 'package:sha/models/operator_card_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/pages/data/data_package_page.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_data_card.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModel? selectedOperator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
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
                  walletName:
                      'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                );
              }
              return Container();
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Select Provider',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                if (state is OperatorCardSuccess) {
                  return Column(
                    children: state.operatorCards
                        .map(
                          (operator) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOperator = operator;
                              });
                            },
                            child: ShaOperatorCard(
                              operatorCardModel: operator,
                              isSelected: (selectedOperator?.id == operator.id),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: kDarkBackgroundColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: (selectedOperator != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: ShaButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DataPackagePage(operatorCard: selectedOperator!),
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
