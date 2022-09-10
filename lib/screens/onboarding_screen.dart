import 'package:c_b_c_online/controllers/onboarding_controller.dart';
import 'package:c_b_c_online/utils/global_constants.dart';
import 'package:c_b_c_online/widgets/onboarding_pageview.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        body: FutureBuilder(
            future: ref.read(onboardingControllerProvider).loadItems(context),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          appName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Skip")
                      ],
                    ),
                    const Expanded(
                      child: OnboardingPageView(),
                    ),
                    DotsIndicator(
                        position: ref
                            .watch(onboardingControllerProvider)
                            .currentPage
                            .toDouble(),
                        dotsCount:
                            ref.read(onboardingControllerProvider).items.length)
                  ],
                ),
              );
            })));
  }
}
