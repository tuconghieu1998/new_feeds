import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/themes/app_sizes.dart';
import 'package:news_feed/themes/styles_text.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({super.key, this.userId, this.avatar, this.name});

  final String? avatar;
  final String? name;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Avatar(size: AppSizes.avatarSize, url: avatar,),
        const SizedBox(height: 10,),
        Text("$name", style: AppStylesText.caption11.bold,),
      ]),
    );
  }
}