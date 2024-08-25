import 'package:flutter/material.dart';
import 'package:sha/ui/pages/auth/sign_in_page.dart';
import 'package:sha/ui/pages/auth/sign_up_page.dart';
import 'package:sha/ui/pages/auth/sign_up_success_page.dart';
import 'package:sha/ui/pages/data/data_provider_page.dart';
import 'package:sha/ui/pages/data/data_success_page.dart';
import 'package:sha/ui/pages/overview_page.dart';
import 'package:sha/ui/pages/onboarding_page.dart';
import 'package:sha/ui/pages/pin_page.dart';
import 'package:sha/ui/pages/profile/profile_edit_page.dart';
import 'package:sha/ui/pages/profile/profile_page.dart';
import 'package:sha/ui/pages/profile/profile_pin_page.dart';
import 'package:sha/ui/pages/profile/profile_success_page.dart';
import 'package:sha/ui/pages/splash_page.dart';
import 'package:sha/ui/pages/topup/topup_page.dart';
import 'package:sha/ui/pages/topup/topup_success_page.dart';
import 'package:sha/ui/pages/transfer/transfer_page.dart';
import 'package:sha/ui/pages/transfer/transfer_success_page.dart';

const String route = '/';
const String onboardRoute = '/onboard';

const String signInRoute = '/auth/sign-in';
const String signUpRoute = '/auth/sign-up';
const String signUpSuccessRoute = '/auth/sign-up/success';
const String overviewRoute = '/overview';
const String pinRoute = '/pin';
const String profileRoute = '/profile';
const String profileEditRoute = '/profile/edit';
const String profilePinRoute = '/profile/pin';
const String profileSuccessRoute = '/profile/success';
const String topUpRoute = '/topup';
const String topUpSuccessRoute = '/topup/success';
const String transferRoute = '/transfer';
const String transferSuccessRoute = '/transfer/success';
const String dataProviderRoute = '/data/provider';
const String dataSuccessRoute = '/data/success';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    route: (context) => const SplashPage(),
    onboardRoute: (context) => const OnboardingPage(),
    signInRoute: (context) => const SignInPage(),
    signUpRoute: (context) => const SignUpPage(),
    signUpSuccessRoute: (context) => const SignUpSuccessPage(),
    overviewRoute: (context) => const OverviewPage(),
    profileRoute: (context) => const ProfilePage(),
    pinRoute: (context) => const PinPage(),
    profileEditRoute: (context) => const ProfileEditPage(),
    profilePinRoute: (context) => const ProfilePinPage(),
    profileSuccessRoute: (context) => const ProfileSuccessPage(),
    topUpRoute: (context) => const TopUpPage(),
    topUpSuccessRoute: (context) => const TopUpSuccessPage(),
    transferRoute: (context) => const TransferPage(),
    transferSuccessRoute: (context) => const TransferSuccessPage(),
    dataProviderRoute: (context) => const DataProviderPage(),
    dataSuccessRoute: (context) => const DataSuccessPage(),
  };
}
