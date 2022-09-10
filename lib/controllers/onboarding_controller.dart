import 'dart:convert';

import 'package:c_b_c_online/models/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends ChangeNotifier {
  List<OnboardingPageViewItem> _items = [];

  List<OnboardingPageViewItem> get items => _items;

  double _currentPage = 0;

  double get currentPage => _currentPage;

  Future loadItems(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/onboarding_items.json');
    Iterable i = json.decode(data);
    _items = i.map((model) => OnboardingPageViewItem.fromMap(model)).toList();
  }

  void updateCurrentPage(int page) {
    _currentPage = page.toDouble();
    notifyListeners();
  }
}

final onboardingControllerProvider = ChangeNotifierProvider((ref) {
  return OnboardingController();
});
