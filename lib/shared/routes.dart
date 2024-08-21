import 'package:flutter/material.dart';
import 'package:sha/ui/pages/auth/sign_in_page.dart';
import 'package:sha/ui/pages/auth/sign_up_page.dart';
import 'package:sha/ui/pages/auth/sign_up_pin_page.dart';
import 'package:sha/ui/pages/auth/sign_up_success_page.dart';
import 'package:sha/ui/pages/auth/sign_up_verify_page.dart';
import 'package:sha/ui/pages/overview_page.dart';
import 'package:sha/ui/pages/onboarding_page.dart';
import 'package:sha/ui/pages/pin_page.dart';
import 'package:sha/ui/pages/profile/profile_edit_page.dart';
import 'package:sha/ui/pages/profile/profile_page.dart';
import 'package:sha/ui/pages/profile/profile_pin_page.dart';
import 'package:sha/ui/pages/profile/profile_success_page.dart';
import 'package:sha/ui/pages/splash_page.dart';

const String route = '/';
const String onboardRoute = '/onboard';

const String signInRoute = '/auth/sign-in';
const String signUpRoute = '/auth/sign-up';
const String signUpPinRoute = '/auth/sign-up/pin';
const String signUpVerifyRoute = '/auth/sign-up/verify';
const String signUpSuccessRoute = '/auth/sign-up/success';

const String overviewRoute = '/overview';
const String pinRoute = '/pin';

const String profileRoute = '/profile';
const String profileEditRoute = '/profile/edit';
const String profilePinRoute = '/profile/pin';
const String profileSuccessRoute = '/profile/success';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    route: (context) => const SplashPage(),
    onboardRoute: (context) => const OnboardingPage(),
    signInRoute: (context) => const SignInPage(),
    signUpRoute: (context) => const SignUpPage(),
    signUpPinRoute: (context) => const SignUpPinPage(),
    signUpVerifyRoute: (context) => const SignUpVerifyPage(),
    signUpSuccessRoute: (context) => const SignUpSuccessPage(),
    overviewRoute: (context) => const OverviewPage(),
    profileRoute: (context) => const ProfilePage(),
    pinRoute: (context) => const PinPage(),
    profileEditRoute: (context) => const ProfileEditPage(),
    profilePinRoute: (context) => const ProfilePinPage(),
    profileSuccessRoute: (context) => const ProfileSuccessPage(),
  };
}
