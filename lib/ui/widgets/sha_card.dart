import 'package:flutter/material.dart';
import 'package:sha/models/payment_method_model.dart';
import 'package:sha/shared/theme.dart';

class ShaCard extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  const ShaCard({
    super.key,
    required this.paymentMethod,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
        border: (isSelected) ? Border.all(color: kBlueColor, width: 2) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network('${paymentMethod.thumbnail}', height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(
                  paymentMethod.name ?? 'unknow',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Text(
                paymentMethod.status ?? 'unknow',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
