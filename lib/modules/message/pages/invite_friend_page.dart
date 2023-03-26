import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/message/widgets/invite_friend_item.dart';

class InviteFriendPage extends StatefulWidget {
  const InviteFriendPage({super.key});

  static const String routeName = "/invite_friend";

  @override
  State<InviteFriendPage> createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          TopBarWidget(title: "InviteFriend"),
          Expanded(
            child: SingleChildScrollView(child: 
            Column(children: [
              InviteFriendItem(),
              InviteFriendItem(),
              InviteFriendItem(),
              InviteFriendItem(),
              InviteFriendItem(),
              InviteFriendItem(),
              InviteFriendItem(),
              InviteFriendItem(),
            ],)
            ))
        ]),
      ),
    );
  }
}