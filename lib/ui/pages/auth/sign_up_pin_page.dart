import 'package:flutter/material.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class SignUpPinPage extends StatefulWidget {
  const SignUpPinPage({super.key});

  @override
  State<SignUpPinPage> createState() => _SignUpPinPageState();
}

class _SignUpPinPageState extends State<SignUpPinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kUploadColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icons/ic_upload.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Kyunzi Permana',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),

                // NOTE : PIN INPUT
                ShaInput(
                  controller: pinController,
                  labelText: 'Set PIN (6 digit number)',
                ),
                ShaButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, signUpVerifyRoute);
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
