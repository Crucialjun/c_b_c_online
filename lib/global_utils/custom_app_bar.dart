import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key});

  @override
  double? get toolbarHeight => 0.0;

  @override
  double? get elevation => 0.0;

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  SystemUiOverlayStyle? get systemOverlayStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      );
}
