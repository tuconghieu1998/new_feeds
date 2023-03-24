import 'package:flutter/material.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class ActionPostItem extends StatelessWidget {
  const ActionPostItem({super.key, this.iconString, this.count, this.onTap});

  final String? iconString;
  final int? count;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ImageIcon(AssetImage(iconString ?? AssetUtils.icoHome), color: Colors.white, size: 24),
          const SizedBox(width: 4,),
          Text("${count ?? 0}", style: AppStylesText.body15,),
        ],
      ),
    );
  }
}