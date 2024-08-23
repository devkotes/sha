import 'package:flutter/material.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_card.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          _WalletSection(
            walletNumber: '8008 2208 1996',
            walletName: 'Balance: ${formatCurrency(12000000)}',
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Select Provider',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_telkomsel.png',
            title: 'Telkomsel',
            subtitle: 'Available',
            isSelected: true,
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_indosat.png',
            title: 'Indosat',
            subtitle: 'Available',
          ),
          const ShaCard(
            imageUrl: 'assets/images/img_singtel.png',
            title: 'Singtel ID',
            subtitle: 'Available',
          ),
          const SizedBox(
            height: 50,
          ),
          ShaButton(
            text: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, dataPackageRoute);
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
