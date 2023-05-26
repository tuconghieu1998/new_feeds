import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/home/widgets/comment_item.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  static const String routeName = '/comments';

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const TopBarWidget(title: "Comments"),
          CommentItem(),
          CommentItem(),
          CommentItem(),
        ],)
      ),
    );
  }
}