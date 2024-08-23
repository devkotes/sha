import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class OverviewMoreItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() onTapped;
  const OverviewMoreItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTapped,
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
                imageUrl,
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
