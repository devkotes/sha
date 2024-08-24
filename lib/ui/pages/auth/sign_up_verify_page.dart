import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/models/form/form_sign_up_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/widgets/sha_button.dart';
import 'package:sha/ui/widgets/sha_text_button.dart';

class SignUpVerifyPage extends StatefulWidget {
  final FormSignUpModel data;
  const SignUpVerifyPage({
    super.key,
    required this.data,
  });

  @override
  State<SignUpVerifyPage> createState() => _SignUpVerifyPageState();
}

class _SignUpVerifyPageState extends State<SignUpVerifyPage> {
  XFile? selectedKtp;

  bool validate() {
    if (selectedKtp == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              signUpSuccessRoute,
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
          return ListView(
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
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
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
                          selectedKtp = image;
                        });
                      },
                      child: Center(
                        child: (selectedKtp != null)
                            ? Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(selectedKtp!.path),
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
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data.copyWith(
                                      ktp: (selectedKtp == null)
                                          ? null
                                          : 'data:image/png;base64,${base64Encode(File(selectedKtp!.path).readAsBytesSync())}'),
                                ),
                              );
                        } else {
                          showCustomSnackbar(context, 'KTP tidak boleh kosong');
                        }
                      },
                      margin: const EdgeInsets.only(top: 50 - 16),
                    )
                  ],
                ),
              ),
              ShaTextButton(
                text: 'Skip for Now',
                onPressed: () {
                  context.read<AuthBloc>().add(AuthRegister(widget.data));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
