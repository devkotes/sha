import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class ProfilePinPage extends StatefulWidget {
  const ProfilePinPage({super.key});

  @override
  State<ProfilePinPage> createState() => _ProfilePinPageState();
}

class _ProfilePinPageState extends State<ProfilePinPage> {
  final TextEditingController oldPinController =
      TextEditingController(text: '');
  final TextEditingController newPinController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 50),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaInput(
                  controller: oldPinController,
                  labelText: 'Old PIN',
                ),
                ShaInput(
                  controller: newPinController,
                  labelText: 'New PIN',
                ),
                ShaButton(
                  text: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      profileSuccessRoute,
                      (route) => false,
                    );
                  },
                  margin: const EdgeInsets.only(top: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
