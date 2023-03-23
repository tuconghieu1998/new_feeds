import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/fake_data.dart';
import 'package:news_feed/modules/message/models/chat_model.dart';
import 'package:news_feed/modules/message/widgets/chat_item.dart';
import 'package:news_feed/modules/message/widgets/friend_item.dart';
import 'package:news_feed/utils/asset_utils.dart';

import '../../../models/user_model.dart';

class ListMessagePage extends StatefulWidget {
  const ListMessagePage({super.key});

  @override
  State<ListMessagePage> createState() => _ListMessagePageState();
}

class _ListMessagePageState extends State<ListMessagePage> {
  List<User> friends = (usersJson["results"] as List<dynamic>).map((user) => User.fromJson(user)).toList();
  List<Chat> chats = (chatJson["results"] as List<dynamic>).map((chat) => Chat.fromJson(chat)).toList();


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
        SizedBox(
  height: 115,
  width: double.infinity,
  child:
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: friends.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
            return FriendItem(
              name: friends[index].name, 
              avatar: friends[index].picture?.medium);
          }
        ),),
        const Divide(
          height: 1,
          color: Colors.black,
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: chats.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
            return ChatItem(
              avatarUrl: chats[index].user?.picture?.medium,
              name: chats[index].user?.name,
              message: chats[index].text,
              createdAt: chats[index].createdAt,
              replyCount: chats[index].replyCount,
            );
             
          }
        ),),
          )   
      ]),
    );
  }
}
