import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class RecentUserItem extends StatelessWidget {
  final String imageUrl;
  final String fullname;
  final String username;
  final bool isVerified;

  const RecentUserItem({
    super.key,
    required this.imageUrl,
    required this.fullname,
    required this.username,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    fullname,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
                Text(
                  '@$username',
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          if (isVerified)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: kGreenColor,
                    size: 14,
                  ),
                ),
                Text(
                  'Verified',
                  style:
                      greenTextStyle.copyWith(fontSize: 11, fontWeight: medium),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
