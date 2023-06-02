import 'package:flutter/material.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/utils/asset_utils.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, this.buttonSize, this.iconSize, this.onTap, this.iconString});
  final double? buttonSize;
  final double? iconSize;
  final Function()? onTap;
  final String? iconString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: buttonSize ?? 36,
          height: buttonSize ?? 36,
          decoration: BoxDecoration(
            gradient: AppColor.pink,
            borderRadius: BorderRadius.circular(buttonSize ?? 36),
          ),
          child: ImageIcon(AssetImage(iconString ?? AssetUtils.icoCamera),
              size: iconSize ?? 24, color: Colors.white),
        ));
  }
}
