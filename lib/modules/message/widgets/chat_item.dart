import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/app_sizes.dart';
import 'package:news_feed/themes/styles_text.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Avatar(
              size: AppSizes.avatarSize,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "JName",
                          style: AppStylesText.body17.copyWith(fontSize: 17),
                        ),
                        Text("04:04PM",
                            style: AppStylesText.body15.copyWith(
                              color: AppColor.unselectItems,
                              fontSize: 13
                            ))
                      ],
                    ),
                    Text(
                      "JName",
                      style:
                          AppStylesText.body17.regular.copyWith(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divide(height: 1, color: Colors.black)
            ],
          ))
        ],
      ),
    );
  }
}
