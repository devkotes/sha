import 'package:flutter/material.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/pages/success_page.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_text_button.dart';

class SignUpVerifyPage extends StatefulWidget {
  const SignUpVerifyPage({super.key});

  @override
  State<SignUpVerifyPage> createState() => _SignUpVerifyPageState();
}

class _SignUpVerifyPageState extends State<SignUpVerifyPage> {
  final TextEditingController pinController = TextEditingController(text: '');

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
            'Verify Your\nAccount',
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
                      child: Image.asset(
                        'assets/icons/ic_upload.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),

                  // NOTE :  REPLACE IMAGE
                  // Container(
                  //   width: 120,
                  //   height: 120,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         'assets/images/img_profile.png',
                  //       ),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Passport/ID Card',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
                ShaButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessPage(
                            title: 'Akun Berhasil\nTerdaftar',
                            subtitle:
                                'Grow your finance start\ntogether with us',
                            buttonText: 'Get Started'),
                      ),
                    );
                  },
                  margin: const EdgeInsets.only(top: 50 - 16),
                ),
              ],
            ),
          ),
          ShaTextButton(
            text: 'Skip for Now',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
