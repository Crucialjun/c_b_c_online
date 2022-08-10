import 'dart:convert';

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

  void loadItems(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/onboarding_items.json');
    Iterable i = json.decode(data);
    List<OnboardingPageViewItem> items =
        i.map((model) => OnboardingPageViewItem.fromMap(model)).toList();
  }
}
