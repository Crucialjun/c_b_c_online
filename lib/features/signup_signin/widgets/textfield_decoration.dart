import 'package:flutter/material.dart';

class TextFieldsDecoration extends InputDecoration {
  final String inputHintText;
  final IconData inputIcon;

  const TextFieldsDecoration(
      {required this.inputHintText, required this.inputIcon});

  @override
  TextStyle? get hintStyle => const TextStyle(color: Colors.grey);

  @override
  Widget? get prefixIcon => Icon(inputIcon);

  @override
  String? get hintText => inputHintText;

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      );

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      );
}
