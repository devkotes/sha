import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';

import '../../widgets/sha_button.dart';
import '../../widgets/sha_input.dart';
import '../../widgets/sha_text_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            'Sign In &\nGrow Your Finance',
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
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 8, bottom: 30),
                  child: Text(
                    'Forgot Password',
                    style: blueTextStyle,
                  ),
                ),
                ShaButton(
                  text: 'Sign In',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          ShaTextButton(
            text: 'Create New Account',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                signUpRoute,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
