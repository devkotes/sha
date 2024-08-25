import 'package:flutter/material.dart';
import 'package:sha/models/tips_model.dart';
import 'package:sha/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class OverviewTipsItem extends StatelessWidget {
  final TipsModel tip;
  const OverviewTipsItem({
    super.key,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(tip.url!))) {
          launchUrl(Uri.parse(tip.url!));
        }
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'assets/images/img_tips1.png',
                width: 155,
                height: 110,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '${tip.title}',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
