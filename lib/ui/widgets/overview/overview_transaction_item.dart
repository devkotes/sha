import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';

class OverviewTransactionItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String value;
  const OverviewTransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: Image.asset(
            icon,
            width: 44,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ),
              Text(
                subtitle,
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        Text(
          value,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
      ],
    );
  }
}
