import 'package:flutter/material.dart';
import 'package:sha/models/user_model.dart';
import 'package:sha/shared/theme.dart';

class OverviewUserItem extends StatelessWidget {
  final UserModel user;
  const OverviewUserItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: (user.profilePicture != null)
                    ? NetworkImage('${user.profilePicture}')
                    : const AssetImage('assets/images/img_profile.png'),
              ),
            ),
            child: (user.verified == 1)
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 12,
                      height: 12,
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
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
