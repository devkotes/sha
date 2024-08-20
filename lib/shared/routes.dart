import 'package:flutter/material.dart';
import 'package:sha/ui/pages/auth/sign_in_page.dart';
import 'package:sha/ui/pages/auth/sign_up_page.dart';
import 'package:sha/ui/pages/auth/sign_up_pin_page.dart';
import 'package:sha/ui/pages/auth/sign_up_verify_page.dart';
import 'package:sha/ui/pages/overview_page.dart';
import 'package:sha/ui/pages/onboarding_page.dart';
import 'package:sha/ui/pages/splash_page.dart';

const String route = '/';
const String onboardRoute = '/onboard';

const String signInRoute = '/auth/sign-in';
const String signUpRoute = '/auth/sign-up';
const String signUpPinRoute = '/auth/sign-up/pin';
const String signUpVerifyRoute = '/auth/sign-up/verify';
const String overviewRoute = '/overview';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    route: (context) => const SplashPage(),
    onboardRoute: (context) => const OnboardingPage(),
    signInRoute: (context) => const SignInPage(),
    signUpRoute: (context) => const SignUpPage(),
    signUpPinRoute: (context) => const SignUpPinPage(),
    signUpVerifyRoute: (context) => const SignUpVerifyPage(),
    overviewRoute: (context) => const OverviewPage(),
  };
}
