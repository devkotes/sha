import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:sha/models/data_plan_model.dart';
import 'package:sha/models/form/form_data_plan_model.dart';
import 'package:sha/models/operator_card_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;
  const DataPackagePage({
    super.key,
    required this.operatorCard,
  });

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final TextEditingController _phoneController =
      TextEditingController(text: '');

  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(selectedDataPlan!.price! * -1),
                );

            Navigator.pushNamedAndRemoveUntil(
              // ignore: use_build_context_synchronously
              context,
              dataSuccessRoute,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kLightBackgroundColor,
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Paket Data'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  child: Text(
                    'Phone Number',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                ShaInput(
                  controller: _phoneController,
                  labelText: '+628',
                  isShowTitle: false,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 14),
                  child: Text(
                    'Select Package',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                if (widget.operatorCard.dataPlan!.isNotEmpty)
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 17,
                    runSpacing: 17,
                    children: widget.operatorCard.dataPlan!
                        .map(
                          (dataPlan) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDataPlan = dataPlan;
                              });
                            },
                            child: _PackageItem(
                              data: dataPlan,
                              isSelected: (selectedDataPlan?.id == dataPlan.id),
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
            floatingActionButton:
                (selectedDataPlan != null && _phoneController.text.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.all(24),
                        child: ShaButton(
                          text: 'Continue',
                          onPressed: () async {
                            if (await Navigator.pushNamed(context, pinRoute) ==
                                true) {
                              // ignore: use_build_context_synchronously
                              final authState = context.read<AuthBloc>().state;
                              String pin = '';

                              if (authState is AuthSuccess) {
                                pin = authState.user.pin!;
                              }

                              // ignore: use_build_context_synchronously
                              context
                                  .read<DataPlanBloc>()
                                  .add(DataPlanPost(FormDataPlanModel(
                                    phoneNumber: _phoneController.text,
                                    dataPlanId: '${selectedDataPlan?.id}',
                                    pin: pin,
                                  )));
                            }
                          },
                        ),
                      )
                    : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}

class _PackageItem extends StatelessWidget {
  final DataPlanModel data;
  final bool isSelected;

  const _PackageItem({
    required this.data,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 171,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: (isSelected) ? kBlueColor : kTransparent,
          width: 2,
        ),
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Text(
              '${data.name}',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
              ),
            ),
          ),
          Text(
            formatCurrency(data.price ?? 0),
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
