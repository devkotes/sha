import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class OverviewUserItem extends StatelessWidget {
  final String imageUrl;
  final String username;
  const OverviewUserItem({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            '@$username',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
