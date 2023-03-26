import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/common_button.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/common/widgets/stateless/outline_button.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class FriendFollowItem extends StatelessWidget {
  const FriendFollowItem({super.key, this.isFollowed});

  final bool? isFollowed; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Avatar(size: 60,),
        ),
        
        Expanded(
          child: Column(children: [
            const SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Paul Gilbert", style: AppStylesText.body17.copyWith(fontSize: 17),),
                  Text("3 mutual friends", style: AppStylesText.body15.copyWith(color: AppColor.unselectItems),)
                ],),
                const Spacer(),
                (isFollowed == true ? OutlineButton(text: "UNFOLLOW",) : CommonButton(text: "FOLLOW",))
              ],),
            ),
            const SizedBox(height: 15,),
            const Divide(height: 1)
          ],),
        )
      ],
    );
  }
}