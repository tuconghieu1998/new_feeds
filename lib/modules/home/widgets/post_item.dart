import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/modules/home/widgets/action_post_item.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/utils/image_utils.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.divideColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ImageUtils.loadFromAsset(AssetUtils.imgPost,
                  width: double.infinity, height: 245, fit: BoxFit.fill,radius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
              Container(
                width: double.infinity,
                height: 245,
                decoration:
                    const BoxDecoration(gradient: AppColor.scrimDarkerBottom30),
              ),
              Positioned(
                  bottom: 15,
                  left: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Avatar(
                        size: 45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pearl Freeman",
                            style: AppStylesText.body17.copyWith(fontSize: 17, height: 17/17),
                          ),
                          Text("2 hours ago", style: AppStylesText.caption13.copyWith(
                            color: Colors.white.withOpacity(0.5), 
                            height: 18/13
                            ))
                        ],
                      )
                    ],
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            child: Column(children: [
              Row(
                children: [Text("#relax", style: AppStylesText.body15.tagColor,),
                 Text(", ",  style: AppStylesText.body15.tagColor,), 
                 Text("#travel",  style: AppStylesText.body15.tagColor,)],
              ),
              const Text(
                  """Coventry is a city with a thousand years of history that has plenty to offer the visiting tourist. Located in the heart of Warwickshire, which is well-known as Shakespeare’s county.""", 
                  style: AppStylesText.body15,
                  ),
                  const SizedBox(height: 25,),
              Row(
                children: const [
                  ActionPostItem(iconString: AssetUtils.icoHeart,),
                  SizedBox(width: 25,),
                  ActionPostItem(iconString: AssetUtils.icoComment,),
                  Spacer(),
                  ActionPostItem(iconString: AssetUtils.icoLeft,),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
