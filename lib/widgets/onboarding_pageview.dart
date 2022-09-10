import 'package:c_b_c_online/controllers/onboarding_controller.dart';
import 'package:c_b_c_online/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageView extends ConsumerStatefulWidget {
  const OnboardingPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends ConsumerState<OnboardingPageView> {
  @override
  void initState() {
    loadItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardingPageViewItem> items =
        ref.read(onboardingControllerProvider).items;
    return PageView.builder(
        onPageChanged: ((value) {
          ref.read(onboardingControllerProvider).updateCurrentPage(value);
        }),
        itemCount: ref.read(onboardingControllerProvider).items.length,
        itemBuilder: ((context, index) {
          return onboardingPageViewHolder(items[index]);
        }));
  }

  Widget onboardingPageViewHolder(
    OnboardingPageViewItem item,
  ) {
    return Column(
      children: [
        SvgPicture.asset("assets/svgs/${item.imageUrl}.svg"),
        Text(
          item.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(item.description),
      ],
    );
  }

  void loadItems() async {
    await ref.read(onboardingControllerProvider).loadItems(context);
  }
}
