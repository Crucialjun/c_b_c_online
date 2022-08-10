import 'package:c_b_c_online/controllers/onboarding_controller.dart';
import 'package:c_b_c_online/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPageView extends ConsumerWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(onboardingControllerProvider).loadItems(context);
    List<OnboardingPageViewItem> items =
        ref.read(onboardingControllerProvider).items;
    return Container(
        child: PageView.builder(
            itemCount: ref.read(onboardingControllerProvider).items.length,
            itemBuilder: ((context, index) {
              return onboardingPageViewHolder(items[index]);
            })));
  }

  Widget onboardingPageViewHolder(
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
