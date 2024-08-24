import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/models/form/form_sign_up_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';
import 'package:sha/ui/pages/auth/sign_up_pin_page.dart';
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

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPinPage(
                  data: FormSignUpModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
            );
          }
        },
        child: ListView(
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kBlackColor,
                          ),
                        );
                      }
                      return ShaButton(
                        text: 'Continue',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                AuthCheckEmail(emailController.text.trim()));
                          } else {
                            showCustomSnackbar(
                              context,
                              'Semua field harus diisi',
                            );
                          }
                        },
                        margin: const EdgeInsets.only(top: 14),
                      );
                    },
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
      ),
    );
  }
}
