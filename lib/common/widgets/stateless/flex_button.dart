import 'package:flutter/material.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class FlexButton extends StatelessWidget {
  const FlexButton({super.key, this.text, this.onTap, this.isWhiteTheme});

  final String? text;
  final Function()? onTap;
  final bool? isWhiteTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        gradient: isWhiteTheme == true ? null : AppColor.pink,
        color: isWhiteTheme == true ? Colors.white : null,
        borderRadius: BorderRadius.circular(22.5)
      ),
      child: Center(child: Text("$text", style: isWhiteTheme == true ? AppStylesText.body15.bold.copyWith(color: AppColor.primaryColor,) : AppStylesText.body15.bold)),
    ));
  }
}