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
        padding: EdgeInsets.symmetric(horizontal: AppSizes.kMediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
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
                  Spacer(),
                  if(rightIcon != null) 
                    GestureDetector(
                      onTap: onTapRight,
                    child: ImageIcon(
                      AssetImage(AssetUtils.icoPlus),
                      color: Colors.white,
                      size: AppSizes.iconSize,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: AppStylesText.headLine1,
            ),
            SizedBox(
              height: 25,
            )
          ],
        ));
  }
}
