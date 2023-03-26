import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/common/widgets/stateless/icon_check_box.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class InviteFriendItem extends StatelessWidget {
  const InviteFriendItem({super.key, this.checked});

  final bool? checked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(children: [
            const Avatar(size: 50,),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Paul Gilbert", style: AppStylesText.body17.copyWith(fontSize: 17),),
              Text("3 mutual friends", style: AppStylesText.body15.copyWith(color: AppColor.unselectItems),)
            ],),
            const Spacer(),
            IconCheckBox(checked: checked,),
            const SizedBox(width: 15,)
          ],),
        ),
        const Divide(height: 1,)
      ]),
    );
  }
}