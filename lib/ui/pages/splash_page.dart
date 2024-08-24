import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sha/blocs/auth/auth_bloc.dart';
import 'package:sha/shared/routes.dart';
import 'package:sha/shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            onboardRoute,
            (route) => false,
          );
        }

        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            overviewRoute,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: kDarkBackgroundColor,
        body: Center(
          child: Container(
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_dark.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
