import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_card.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          const _WalletSection(
            walletNumber: '8008 2208 1996',
            walletName: 'Kyunzi Permana',
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Select Bank',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_bca.png',
            bankName: 'BANK BCA',
            bankAvailable: '50 mins',
            isSelected: true,
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_bni.png',
            bankName: 'BANK BNI',
            bankAvailable: '50 mins',
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_mandiri.png',
            bankName: 'BANK Mandiri',
            bankAvailable: '50 mins',
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_ocbc.png',
            bankName: 'BANK OCBC',
            bankAvailable: '50 mins',
          ),
          const SizedBox(
            height: 12,
          ),
          ShaButton(
            text: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, topUpAmountRoute);
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}

class _WalletSection extends StatelessWidget {
  final String walletNumber;
  final String walletName;
  const _WalletSection({
    required this.walletNumber,
    required this.walletName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Wallet',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 55,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/img_wallet_small.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    walletNumber,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    walletName,
                    style: greyTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
