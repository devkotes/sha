import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/profile/menu_item.dart';
import 'package:sha/ui/widgets/sha_text_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              signInRoute,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kBlackColor,
              ),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: (state.user.profilePicture == null)
                                ? const AssetImage(
                                    'assets/images/img_profile.png',
                                  )
                                : NetworkImage(state.user.profilePicture!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: (state.user.verified == 1)
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icons/ic_check.png',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      Text(
                        '${state.user.name}',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MenuItem(
                        icon: 'assets/icons/ic_user.png',
                        title: 'Edit Profile',
                        onTapped: () async {
                          if (await Navigator.pushNamed(context, pinRoute) ==
                              true) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, profileEditRoute);
                          }
                        },
                      ),
                      MenuItem(
                        icon: 'assets/icons/ic_pin.png',
                        title: 'My PIN',
                        onTapped: () async {
                          if (await Navigator.pushNamed(context, pinRoute) ==
                              true) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, profilePinRoute);
                          }
                        },
                      ),
                      MenuItem(
                        icon: 'assets/icons/ic_wallet.png',
                        title: 'Wallet Setting',
                        onTapped: () {},
                      ),
                      MenuItem(
                        icon: 'assets/icons/ic_my_reward.png',
                        title: 'My Reward',
                        onTapped: () {},
                        countReward: 3,
                      ),
                      MenuItem(
                        icon: 'assets/icons/ic_help.png',
                        title: 'Help Center',
                        onTapped: () {},
                      ),
                      MenuItem(
                        icon: 'assets/icons/ic_logout.png',
                        title: 'Log Out',
                        onTapped: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                ShaTextButton(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  text: 'Report a Problem',
                  onPressed: () {},
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
