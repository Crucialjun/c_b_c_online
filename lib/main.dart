import 'package:c_b_c_online/features/dashboard/screens/main_dashboard.dart';
import 'package:c_b_c_online/features/onboarding/screens/onboarding_screen.dart';
import 'package:c_b_c_online/firebase/firebase_authentication.dart';
import 'package:c_b_c_online/firebase_options.dart';
import 'package:c_b_c_online/global_utils/error_screen.dart';
import 'package:c_b_c_online/global_utils/loading_screen.dart';
import 'package:c_b_c_online/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        home: ref.watch(userAutheProvider).when(data: (user) {
          if (user == null) {
            return const OnboardingScreen();
          } else {
            return const MainDashboard();
          }
        }, error: ((error, stackTrace) {
          return ErrorScreen(errorMsg: error.toString());
        }), loading: () {
          return const LoadingScreen();
        }));
  }
}
