import 'package:flutter/cupertino.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/utils/image_utils.dart';

class NotiTextAndImageContent extends StatelessWidget {
  const NotiTextAndImageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "The Luxury Of Traveling With Yacht Charter Companies",
                style: AppStylesText.body15,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "2 hours ago",
                style: AppStylesText.body15.subColor,
              )
            ],
          ),
        ),
        ImageUtils.loadFromAsset(AssetUtils.imgNotify4,
            width: 57, height: 57, fit: BoxFit.fill)
      ],
    );
  }
}
