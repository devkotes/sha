import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';

class DataSuccessPage extends StatelessWidget {
  const DataSuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 26),
              child: Text(
                'Paket Data\nBerhasil Terbeli',
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
                'Use the money wisely and\ngrow your finance',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ShaButton(
              width: 183,
              text: 'Back To Home',
              margin: const EdgeInsets.only(bottom: 20),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  overviewRoute,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
