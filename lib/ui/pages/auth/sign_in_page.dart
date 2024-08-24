import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/models/form/form_sign_in_model.dart';
import 'package:sha/shared/methods.dart';
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

  bool validate() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
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
              overviewRoute,
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
                'Sign In &\nGrow Your Finance',
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
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  FormSignInModel(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(
                            context,
                            'Semua field harus diisi',
                          );
                        }
                      },
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
          );
        },
      ),
    );
  }
}
