import 'package:flutter/material.dart';
import 'package:news_feed/utils/asset_utils.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        Navigator.of(context).pop();
      },
      child: const SizedBox(
        width: 28,
        height: 28,
        child: Center(child: ImageIcon(AssetImage(AssetUtils.icoArrowLeft), color: Colors.white, size: 28,),)
      ),
    );
  }
}