import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class ShaServiceItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function()? onTapped;
  const ShaServiceItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 26,
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
