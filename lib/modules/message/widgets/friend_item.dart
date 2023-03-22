import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/themes/app_sizes.dart';
import 'package:news_feed/themes/styles_text.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Avatar(size: AppSizes.avatarSize,),
        SizedBox(height: 10,),
        Text("Name", style: AppStylesText.caption11.bold,),
      ]),
    );
  }
}