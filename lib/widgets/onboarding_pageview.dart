import 'package:c_b_c_online/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboardingPageViewItem page1 = OnboardingPageViewItem(
        title: "Title 1",
        description: "Title 1 decription",
        imageUrl: "imageUrl");
    OnboardingPageViewItem page2 = OnboardingPageViewItem(
        title: "Title 1",
        description: "Title 1 decription",
        imageUrl: "imageUrl");
    OnboardingPageViewItem page3 = OnboardingPageViewItem(
        title: "Title 1",
        description: "Title 1 decription",
        imageUrl: "imageUrl");
    return Container(
      child: Column(children: const []),
    );
  }
}
