import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/utils/image_utils.dart';

class NotiImageContent extends StatelessWidget {
  const NotiImageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ImageUtils.loadFromAsset(AssetUtils.imgNotify1),
            const SizedBox(width: 5,),
            ImageUtils.loadFromAsset(AssetUtils.imgNotify2),
            const SizedBox(width: 5,),
            ImageUtils.loadFromAsset(AssetUtils.imgNotify3)
          ],
        ),
        const SizedBox(height: 10,),
        Text("2 hours ago", style: AppStylesText.body15.subColor,)
      ],
    );
  }
}