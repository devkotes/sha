import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTapped;
  final int countReward;
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTapped,
    this.countReward = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: onTapped,
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 18),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icon),
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
            ),
            if (countReward != 0)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: kBlueColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$countReward',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
