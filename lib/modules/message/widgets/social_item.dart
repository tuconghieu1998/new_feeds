import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({super.key, this.name, this.iconString, this.color});

  final String? name;
  final String? iconString;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 128,
      decoration: BoxDecoration(
        color: color ?? Color(0xff0C66FF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(right: 15),
      
      child: Column(
        children: [
          const SizedBox(height: 15,),
        Container(
          width: 50, height: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: ImageIcon(AssetImage(iconString ?? AssetUtils.icoFacebook), color: color ??Color(0xff0C66FF),),
          ),
        Text("$name", style: AppStylesText.body17.copyWith(fontSize: 17),),
        Text("Connect", style: AppStylesText.body15.copyWith(color: Colors.white.withOpacity(0.5)),)
      ]),
    );
  }
}