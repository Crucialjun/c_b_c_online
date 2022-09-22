import 'package:c_b_c_online/features/onboarding/screens/onboarding_screen.dart';
import 'package:c_b_c_online/features/onboarding/screens/sign_up_screen.dart';
import 'package:c_b_c_online/global_utils/error_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    default:
      return MaterialPageRoute(
          builder: (_) =>
              const ErrorScreen(errorMsg: "This page does not exist"));
  }
}
