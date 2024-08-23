import 'package:flutter/material.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class DataPackagePage extends StatefulWidget {
  const DataPackagePage({super.key});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Phone Number',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          ShaInput(
            controller: searchController,
            labelText: '+628',
            isShowTitle: false,
          ),
          // const _RecentUser(),
          const _ResultPackage(),
        ],
      ),
    );
  }
}

class _ResultPackage extends StatelessWidget {
  const _ResultPackage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 14),
          child: Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
        Center(
          child: Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              _PackageItem(
                packageName: '10GB',
                price: formatCurrency(280000),
                isSelected: true,
              ),
              _PackageItem(
                packageName: '25GB',
                price: formatCurrency(420000),
              ),
              _PackageItem(
                packageName: '40GB',
                price: formatCurrency(2500000),
              ),
              _PackageItem(
                packageName: '99GB',
                price: formatCurrency(5000000),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
        ShaButton(
          text: 'Continue',
          onPressed: () async {
            if (await Navigator.pushNamed(context, pinRoute) == true) {
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, dataSuccessRoute);
            }
          },
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _PackageItem extends StatelessWidget {
  final String packageName;
  final String price;
  final bool isSelected;

  const _PackageItem({
    required this.packageName,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 171,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: (isSelected) ? kBlueColor : kTransparent,
          width: 2,
        ),
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Text(
              packageName,
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
              ),
            ),
          ),
          Text(
            price,
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
