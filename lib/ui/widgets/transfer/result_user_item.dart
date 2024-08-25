import 'package:flutter/material.dart';
import 'package:sha/models/user_model.dart';
import 'package:sha/shared/theme.dart';

class ResultUserItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;

  const ResultUserItem({
    super.key,
    required this.user,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
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
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: (user.profilePicture != null)
                    ? NetworkImage(
                        '${user.profilePicture}',
                      )
                    : const AssetImage('assets/images/img_profile.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: (user.verified == 1)
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icons/ic_check.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Text(
              '${user.name}',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
          Text(
            '@${user.username}',
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
