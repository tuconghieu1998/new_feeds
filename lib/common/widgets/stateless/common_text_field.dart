import 'package:flutter/material.dart';
import '../../../themes/styles_text.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key, this.placeHolder});

  final String? placeHolder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: placeHolder ?? "",
          hintStyle: AppStylesText.body15,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22.5)),
          focusColor: Colors.black,
          fillColor: Colors.white.withOpacity(0.2),
          filled: true),
      style: AppStylesText.body15,
    );
  }
}
