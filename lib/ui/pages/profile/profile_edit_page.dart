import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
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
                  controller: usernameController,
                  labelText: 'Username',
                ),
                ShaInput(
                  controller: nameController,
                  labelText: 'Full Name',
                ),
                ShaInput(
                  controller: emailController,
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                ShaInput(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  keyboardAction: TextInputAction.go,
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
