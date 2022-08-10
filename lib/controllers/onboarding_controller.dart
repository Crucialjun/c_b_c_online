import 'dart:convert';

import 'package:c_b_c_online/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController {
  List<OnboardingPageViewItem> _items = [];

  List<OnboardingPageViewItem> get items => _items;

  void loadItems(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/onboarding_items.json');
    print(data);
    Iterable i = json.decode(data);
    _items = i.map((model) => OnboardingPageViewItem.fromMap(model)).toList();
  }
}

final onboardingControllerProvider = Provider((ref) {
  return OnboardingController();
});
