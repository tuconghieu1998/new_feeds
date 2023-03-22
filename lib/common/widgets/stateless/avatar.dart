import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/utils/image_utils.dart';

enum Status {
  active,
  disactive,
}

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.size, this.onTap, this.status});

  final double? size;
  final Function()? onTap;
  final Status? status;

  @override
  Widget build(BuildContext context) {
    double sizeImage = size ?? 48;
    return GestureDetector(
      onTap: onTap,
      child: ImageUtils.loadFromAsset(AssetUtils.avatar, width: sizeImage, height: sizeImage, radius: BorderRadius.circular(sizeImage)),
    );
  }
}