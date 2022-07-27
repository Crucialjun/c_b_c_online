import 'package:c_b_c_online/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: const [],
      ),
    );
  }

  Widget OnboardingPageViewHolder(
    OnboardingPageViewItem item,
  ) {
    return Column(
      children: [
        Text(item.title),
        Text(item.description),
        Image.asset("imageUrl"),
      ],
    );
  }
}
