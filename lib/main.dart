import 'package:c_b_c_online/features/onboarding/screens/onboarding_screen.dart';
import 'package:c_b_c_online/global_utils/error_screen.dart';
import 'package:c_b_c_online/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CBC Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      onUnknownRoute: ((settings) => MaterialPageRoute(
          builder: (_) => const ErrorScreen(errorMsg: "Unknown Route"))),
      home: const OnboardingScreen(),
    );
  }
}
