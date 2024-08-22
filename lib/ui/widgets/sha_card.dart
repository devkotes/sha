import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class ShaCard extends StatelessWidget {
  final String imageUrl;
  final String bankName;
  final String bankAvailable;
  final bool isSelected;
  const ShaCard({
    super.key,
    required this.imageUrl,
    required this.bankName,
    required this.bankAvailable,
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
        border: Border.all(
          color: (isSelected) ? kBlueColor : kTransparent,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imageUrl, height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(
                  bankName,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Text(
                bankAvailable,
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
