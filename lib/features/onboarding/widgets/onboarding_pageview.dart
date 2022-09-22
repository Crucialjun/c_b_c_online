import 'package:c_b_c_online/features/onboarding/controllers/onboarding_controller.dart';
import 'package:c_b_c_online/features/onboarding/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageView extends ConsumerStatefulWidget {
  final PageController pageController;
  const OnboardingPageView({required this.pageController, Key? key})
      : super(key: key);

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
    List items = ref.read(onboardingControllerProvider).items;
    return PageView.builder(
        controller: widget.pageController,
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
        Expanded(child: SvgPicture.asset("assets/svgs/${item.imageUrl}.svg")),
        Text(
          item.title,
          style: const TextStyle(
              letterSpacing: 1.5,
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, color: Colors.blueGrey, height: 2.0),
        ),
      ],
    );
  }

  void loadItems() async {
    await ref.read(onboardingControllerProvider).loadItems(context);
  }
}
