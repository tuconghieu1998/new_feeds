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
  const Avatar({super.key, this.size, this.onTap, this.status, this.url});

  final double? size;
  final Function()? onTap;
  final Status? status;
  final String? url;

  @override
  Widget build(BuildContext context) {
    double sizeImage = size ?? 48;
    return GestureDetector(
      onTap: onTap,
      child: //url != null ? ImageUtils.loadAvatar(url ?? "", width: sizeImage, height: sizeImage, radius: BorderRadius.circular(sizeImage))
      ImageUtils.loadFromAsset(AssetUtils.avatar, width: sizeImage, height: sizeImage, radius: BorderRadius.circular(sizeImage)),
    );
  }
}