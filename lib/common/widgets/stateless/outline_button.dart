import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, this.width, this.height, this.onTap, this.text, this.borderRadius});

  final double? width;
  final double? height;
  final Function()? onTap;
  final String? text;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 87,
        height: height ?? 35,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 22.5)
        ),
        child: Center(child: Text("$text",style: AppStylesText.caption11.copyWith(color: AppColor.primaryColor,)))
      ),
    );
  }
}