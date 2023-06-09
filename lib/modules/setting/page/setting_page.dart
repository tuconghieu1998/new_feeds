import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/modules/setting/widget/setting_tile.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  static const String routeName = "/setting";

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(color: Colors.white,),
              SizedBox(height: 20,),
              Text("Settings", style: AppStylesText.headLine1.copyWith(fontSize: 34),),
              const SizedBox(height: 20,),
              const Divide(height: 1, color: Colors.black, opacity: 0.2,),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      SettingTile(title: "Push Notifications",),
                      SettingTile(title: "Language",),
                      SettingTile(title: "Linked Accounts",),
                      SettingTile(title: "Blocked Accounts",),
                      SettingTile(title: "Search History",),
                      SettingTile(title: "Report a Problem",),
                    ]),
                ),
              )
            ],
          ),
        ) 
        ),
    );
  }
}