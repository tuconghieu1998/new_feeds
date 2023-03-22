import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/message/widgets/chat_item.dart';
import 'package:news_feed/modules/message/widgets/friend_item.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/app_sizes.dart';
import 'package:news_feed/utils/asset_utils.dart';

class ListMessagePage extends StatefulWidget {
  const ListMessagePage({super.key});

  @override
  State<ListMessagePage> createState() => _ListMessagePageState();
}

class _ListMessagePageState extends State<ListMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        TopBarWidget(
          title: "Messages",
          rightIcon: AssetUtils.icoPlus,
          onTapRight: () {
            print("Add Friends");
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.kMediumPadding),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                FriendItem(),
                FriendItem(),
                FriendItem(),
                FriendItem(),
                FriendItem(),
                FriendItem(),
                FriendItem(),
                FriendItem(),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        Divide(
          height: 1,
          color: Colors.black,
        ),
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
          ]),
        ))
        
        
      ]),
    );
  }
}
