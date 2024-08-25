import 'package:flutter/material.dart';
import 'package:sha/models/operator_card_model.dart';
import 'package:sha/shared/theme.dart';

class ShaOperatorCard extends StatelessWidget {
  final OperatorCardModel operatorCardModel;
  final bool isSelected;
  const ShaOperatorCard({
    super.key,
    required this.operatorCardModel,
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
          Image.network('${operatorCardModel.thumbnail}', height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(
                  operatorCardModel.name ?? 'unknow',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Text(
                operatorCardModel.status ?? 'unknow',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
