import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/overview/overview_more_item.dart';
import 'package:sha/ui/widgets/overview/overview_service_item.dart';
import 'package:sha/ui/widgets/overview/overview_tips_item.dart';
import 'package:sha/ui/widgets/overview/overview_transaction_item.dart';
import 'package:sha/ui/widgets/overview/overview_user_item.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        color: kWhiteColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          backgroundColor: kWhiteColor,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kBlueColor,
          unselectedItemColor: kBlackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_overview.png',
                width: 20,
                color: kBlueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_history.png',
                width: 20,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_statistic.png',
                width: 20,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_reward.png',
                width: 20,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          useMaterial3: false,
        ),
        child: FloatingActionButton(
          backgroundColor: kPurpleColor,
          onPressed: () {},
          child: Image.asset(
            'assets/icons/ic_add.png',
            width: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: const [
          _ProfileSection(),
          _WalletSection(),
          _LevelSection(),
          _ServiceSection(),
          _LastTransactionSection(),
          _SendAgainSection(),
          _FriendlyTips(),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: greySecondTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      '${state.user.username}',
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, profileRoute);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
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
                              width: 14,
                              height: 14,
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
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _WalletSection extends StatelessWidget {
  const _WalletSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 220,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_wallet.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 28),
                  child: Text(
                    '${state.user.name}',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                      letterSpacing: 8,
                    ),
                  ),
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle,
                ),
                Text(
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _LevelSection extends StatelessWidget {
  const _LevelSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                ' of ${formatCurrency(200000)}',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(kGreenColor),
              backgroundColor: kLightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }
}

class _ServiceSection extends StatelessWidget {
  const _ServiceSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Do Something',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OverviewServiceItem(
                title: 'Top Up',
                icon: 'assets/icons/ic_download.png',
                onTapped: () {
                  Navigator.pushNamed(context, topUpRoute);
                },
              ),
              OverviewServiceItem(
                title: 'Send',
                icon: 'assets/icons/ic_send.png',
                onTapped: () {
                  Navigator.pushNamed(context, transferRoute);
                },
              ),
              OverviewServiceItem(
                title: 'Withdraw',
                icon: 'assets/icons/ic_withdraw.png',
                onTapped: () {},
              ),
              OverviewServiceItem(
                title: 'More',
                icon: 'assets/icons/ic_more.png',
                onTapped: () {
                  showDialog(
                    context: context,
                    builder: (context) => const _MoreDialog(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LastTransactionSection extends StatelessWidget {
  const _LastTransactionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Latest Transactions',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                OverviewTransactionItem(
                  icon: 'assets/icons/ic_type_topup.png',
                  title: 'Top Up',
                  subtitle: 'Yesterday',
                  value: formatCurrency(450000, symbol: '+ '),
                ),
                const SizedBox(height: 18),
                OverviewTransactionItem(
                  icon: 'assets/icons/ic_type_cashback.png',
                  title: 'Cashback',
                  subtitle: 'Sep 11',
                  value: formatCurrency(220000, symbol: '- '),
                ),
                const SizedBox(height: 18),
                OverviewTransactionItem(
                  icon: 'assets/icons/ic_type_withdraw.png',
                  title: 'Withdraw',
                  subtitle: 'Sep 2',
                  value: formatCurrency(4000, symbol: '+ '),
                ),
                const SizedBox(height: 18),
                OverviewTransactionItem(
                  icon: 'assets/icons/ic_type_transfer.png',
                  title: 'Transfer',
                  subtitle: 'Aug 27',
                  value: formatCurrency(124000, symbol: '- '),
                ),
                const SizedBox(height: 18),
                OverviewTransactionItem(
                  icon: 'assets/icons/ic_type_electric.png',
                  title: 'Electric',
                  subtitle: 'Feb 18',
                  value: formatCurrency(1230000, symbol: '+ '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SendAgainSection extends StatelessWidget {
  const _SendAgainSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Send Again',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                OverviewUserItem(
                  imageUrl: 'assets/images/img_friend_1.png',
                  username: 'yuanita',
                ),
                OverviewUserItem(
                  imageUrl: 'assets/images/img_friend_2.png',
                  username: 'jani',
                ),
                OverviewUserItem(
                  imageUrl: 'assets/images/img_friend_3.png',
                  username: 'urip',
                ),
                OverviewUserItem(
                  imageUrl: 'assets/images/img_friend_4.png',
                  username: 'masa',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendlyTips extends StatelessWidget {
  const _FriendlyTips();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Friendly Tips',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          const Center(
            child: Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                OverviewTipsItem(
                  imageUrl: 'assets/images/img_tips1.png',
                  title: 'Best tips for using a credit card',
                  url: 'https://google.com',
                ),
                OverviewTipsItem(
                  imageUrl: 'assets/images/img_tips2.png',
                  title: 'Spot the good pie of finance model',
                  url: 'https://google.com',
                ),
                OverviewTipsItem(
                  imageUrl: 'assets/images/img_tips3.png',
                  title: 'Great hack to get better advices',
                  url: 'https://google.com',
                ),
                OverviewTipsItem(
                  imageUrl: 'assets/images/img_tips4.png',
                  title: 'Save more penny buy this instead',
                  url: 'https://google.com',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MoreDialog extends StatelessWidget {
  const _MoreDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kTransparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kLightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 13),
              child: Text(
                'Do More With Us',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Center(
              child: Wrap(
                spacing: 29,
                runSpacing: 29,
                children: [
                  OverviewMoreItem(
                    imageUrl: 'assets/icons/ic_dana.png',
                    title: 'Dana',
                    onTapped: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, dataProviderRoute);
                    },
                  ),
                  OverviewMoreItem(
                    imageUrl: 'assets/icons/ic_water.png',
                    title: 'Water',
                    onTapped: () {},
                  ),
                  OverviewMoreItem(
                    imageUrl: 'assets/icons/ic_stream.png',
                    title: 'Stream',
                    onTapped: () {},
                  ),
                  OverviewMoreItem(
                    imageUrl: 'assets/icons/ic_movie.png',
                    title: 'Movie',
                    onTapped: () {},
                  ),
                  OverviewMoreItem(
                    imageUrl: 'assets/icons/ic_food.png',
                    title: 'Food',
                    onTapped: () {},
                  ),
                  OverviewMoreItem(
                    imageUrl: 'assets/icons/ic_travel.png',
                    title: 'Travel',
                    onTapped: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
