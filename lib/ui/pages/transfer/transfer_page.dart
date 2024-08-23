import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';
import 'package:sha/ui/widgets/transfer/recent_user_item.dart';
import 'package:sha/ui/widgets/transfer/result_user_item.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Search',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          ShaInput(
            controller: searchController,
            labelText: 'By Username',
            isShowTitle: false,
          ),
          // const _RecentUser(),
          const _ResultUser(),
        ],
      ),
    );
  }
}

class _RecentUser extends StatelessWidget {
  const _RecentUser();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 14),
          child: Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
        const RecentUserItem(
          imageUrl: 'assets/images/img_friend_1.png',
          fullname: 'Yonna Jie',
          username: 'yoenna',
          isVerified: true,
        ),
        const RecentUserItem(
          imageUrl: 'assets/images/img_friend_3.png',
          fullname: 'John Hi',
          username: 'jhi',
        ),
        const RecentUserItem(
          imageUrl: 'assets/images/img_friend_4.png',
          fullname: 'Masayoshi',
          username: 'form',
        ),
      ],
    );
  }
}

class _ResultUser extends StatelessWidget {
  const _ResultUser();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 14),
          child: Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
        Wrap(
          spacing: 17,
          runSpacing: 17,
          children: [
            const ResultUserItem(
              imageUrl: 'assets/images/img_friend_1.png',
              fullname: 'Yonna Jie',
              username: 'yoenna',
              isVerified: true,
            ),
            const ResultUserItem(
              imageUrl: 'assets/images/img_friend_4.png',
              fullname: 'Yonne Ka',
              username: 'yoenyu',
              isSelected: true,
            ),
          ],
        ),
        const SizedBox(height: 200),
        ShaButton(
          text: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, transferAmountRoute);
          },
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
