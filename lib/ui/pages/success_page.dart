import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';

class SuccessPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  const SuccessPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 26),
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Text(
                subtitle,
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ShaButton(
              width: 183,
              text: 'Get Started',
              margin: const EdgeInsets.only(bottom: 20),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
