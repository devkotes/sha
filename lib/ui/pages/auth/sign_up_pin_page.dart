import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sha/models/form/form_sign_up_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/pages/auth/sign_up_verify_page.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_input.dart';

class SignUpPinPage extends StatefulWidget {
  final FormSignUpModel data;
  const SignUpPinPage({
    super.key,
    required this.data,
  });

  @override
  State<SignUpPinPage> createState() => _SignUpPinPageState();
}

class _SignUpPinPageState extends State<SignUpPinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

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
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
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
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Center(
                    child: (selectedImage != null)
                        ? Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(
                                  File(selectedImage!.path),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
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
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    '${widget.data.name}',
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
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),
                ShaButton(
                  text: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpVerifyPage(
                            data: widget.data.copyWith(
                                pin: pinController.text.trim(),
                                profilePicture: (selectedImage == null)
                                    ? null
                                    : 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackbar(context, 'PIN harus 6 karakter');
                    }
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
