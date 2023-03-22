import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_feed/utils/asset_utils.dart';

class ImageUtils {
  static Widget loadFromAsset(
    String imageFilePath, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    if (imageFilePath.toLowerCase().endsWith('svg')) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: SvgPicture.asset(
          imageFilePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: tintColor,
          alignment: alignment ?? Alignment.center,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: Image.asset(
          imageFilePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: tintColor,
          alignment: alignment ?? Alignment.center,
        ),
      );
    }
  }

  static Widget loadAvatar(
  String imageUrl, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: FadeInImage.assetNetwork(
        placeholder: AssetUtils.avatar,
        imageErrorBuilder: (context, error, stackTrace) {
          return loadFromAsset(
            AssetUtils.avatar,
            width: width,
            height: height,
            radius: radius,
            fit: fit,
            tintColor: tintColor,
            alignment: alignment,
          );
        },
        image: imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        alignment: alignment ?? Alignment.center,
      )
    );
 }

 static Widget loadImgUrl(
  String imageUrl, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: FadeInImage.assetNetwork(
        placeholder: AssetUtils.gifLoading,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: radius
            ),
            alignment: alignment,
            width: width,
            height: height,
            child: const Icon(Icons.error),
          );
        },
        image: imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        alignment: alignment ?? Alignment.center,
      )
    );
 }
}
