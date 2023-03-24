import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/message/widgets/social_item.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  static const String routeName = "/friends";

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TopBarWidget(
            title: "Friends",
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Connect to find more friends",
                style: AppStylesText.body20
                    .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
              )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            child: Row(children: const [
              SocialItem(
                name: "Facebook",
                iconString: AssetUtils.icoFacebook,
                color: Color(0xff0C66FF),
              ),
              SocialItem(
                name: "Twitter",
                iconString: AssetUtils.icoTwitter,
                color: Color(0xff1BB1E6),
              ),
              SocialItem(
                name: "Facebook",
                iconString: AssetUtils.icoFacebook,
                color: Color(0xff0C66FF),
              ),
              SocialItem(
                name: "Twitter",
                iconString: AssetUtils.icoTwitter,
                color: Color(0xff1BB1E6),
              ),
            ]),
          ),
          const SizedBox(height: 30,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
              Text(
                "Suggestions",
                style: AppStylesText.body20
                    .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Spacer(),
              Text("Follow all", style: AppStylesText.body15.copyWith(color: AppColor.primaryColor,)),
          ],)),
        ]),
      ),
    );
  }
}
