import 'package:flutter/cupertino.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/modules/home/models/comment.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, this.data});
  final Comment? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Avatar(size: 50,),
          ),
          Container(width: MediaQuery.of(context).size.width - 95,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
            Text("Eugene Rodriquez", style: AppStylesText.body17.copyWith(fontSize: 22),),
            Text("2 hours ago", style: AppStylesText.caption13.copyWith(color: AppColor.unselectItems),),
            Text(
              data?.content ?? "",
              style: AppStylesText.body17.copyWith(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            GestureDetector(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Reply", style: AppStylesText.body15.copyWith(color: AppColor.primaryColor,),),
            ),),
            const Divide(height: 1,)
          ],)
          ),
          
          
        ],
      ),
    );
  }
}