import 'package:flutter/material.dart';
import 'package:news_feed/themes/app_sizes.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key, required this.title, this.leftIcon, this.rightIcon, this.onTapLeft, this.onTapRight});

  final String? leftIcon;
  final String? rightIcon;
  final Function()? onTapLeft;
  final Function()? onTapRight;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.kMediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onTapLeft ?? () {
                      Navigator.of(context).pop();
                    },
                    child: ImageIcon(
                      AssetImage(leftIcon ?? AssetUtils.icoArrowLeft),
                      color: Colors.white,
                      size: AppSizes.iconSize,
                    ),
                  ),
                  const Spacer(),
                  if(rightIcon != null) 
                    GestureDetector(
                      onTap: onTapRight,
                    child: const ImageIcon(
                      AssetImage(AssetUtils.icoPlus),
                      color: Colors.white,
                      size: AppSizes.iconSize,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: AppStylesText.headLine1.copyWith(fontSize: 34),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ));
  }
}
