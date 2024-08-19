import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

import '../../widgets/sha_text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo_light.png',
                ),
              ),
            ),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
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
                // NOTE : EMAIL INPUT
                ShaInput(
                  controller: nameController,
                  labelText: 'Full Name',
                ),
                // NOTE : EMAIL INPUT
                ShaInput(
                  controller: emailController,
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                // NOTE : Password INPUT
                ShaInput(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  keyboardAction: TextInputAction.go,
                ),
                ShaButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, signUpPinRoute);
                  },
                  margin: const EdgeInsets.only(top: 14),
                ),
              ],
            ),
          ),
          ShaTextButton(
            text: 'Sign In',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                signInRoute,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
