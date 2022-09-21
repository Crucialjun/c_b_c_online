import 'package:c_b_c_online/controllers/onboarding_controller.dart';
import 'package:c_b_c_online/utils/app_colors.dart';
import 'package:c_b_c_online/utils/global_constants.dart';
import 'package:c_b_c_online/widgets/onboarding_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            appName,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _pageController.jumpToPage(4);
                            },
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColorLight,
                                  fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: OnboardingPageView(
                          pageController: _pageController,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SmoothPageIndicator(
                          effect: const SlideEffect(
                              activeDotColor: AppColors.primaryColorLight,
                              dotHeight: 10),
                          controller: _pageController,
                          count: ref
                              .read(onboardingControllerProvider)
                              .items
                              .length),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColor),
                          onPressed: (() {}),
                          child: const Text("Create Account")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: AppColors.primaryColor),
                              onPrimary: AppColors.primaryColor,
                              primary: Colors.white),
                          onPressed: (() {}),
                          child: const Text("I already have an account"))
                    ],
                  ),
                ),
              );
            })));
  }
}
