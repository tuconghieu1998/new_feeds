import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateful/search_bar.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/circle_icon_button.dart';
import 'package:news_feed/common/widgets/stateless/common_button.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/common/widgets/stateless/outline_button.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class CommonWidgetScreen extends StatefulWidget {
  const CommonWidgetScreen({super.key});

  static const String routeName = "/common_widget";

  @override
  State<CommonWidgetScreen> createState() => _CommonWidgetScreenState();
}

class _CommonWidgetScreenState extends State<CommonWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 100,),
              Row (children: [
                SizedBox(width: 24,),
                Avatar(size: 48),
                SizedBox(width: 24,),
                Avatar(size: 72),
                SizedBox(width: 24,),
                Avatar(size: 96),
              ],),
              SizedBox(height: 20,),
              Text("Head Line 1", style: AppStylesText.headLine1,),
              SizedBox(height: 20,),
              Text("Head Line 2", style: AppStylesText.headLine2,),
              SizedBox(height: 20,),
              Text("Head Line 3", style: AppStylesText.headLine3,),
              SizedBox(height: 20,),
              Text("Body20", style: AppStylesText.body20,),
              SizedBox(height: 20,),
              Text("Body15", style: AppStylesText.body15,),
              SizedBox(height: 20,),
              Text("Body17", style: AppStylesText.body17,),
              SizedBox(height: 20,),
              Text("Caption13", style: AppStylesText.caption13,),
              SizedBox(height: 20,),
              Text("Caption11", style: AppStylesText.caption11,),
              SizedBox(height: 20,),
              Text("Tagline", style: AppStylesText.tagline,),
              SizedBox(height: 20,),
              TopBarWidget(title: "Friends", rightIcon: AssetUtils.icoPlus,),
              SizedBox(height: 20,),
              Divide(height: 1, color: Colors.white),
              SizedBox(height: 20,),
              SearchBar(),
              SizedBox(height: 20,),
              CircleIconButton(),
              SizedBox(height: 20,),
              CommonButton(),
              SizedBox(height: 20,),
              OutlineButton()

            ]),
          ),
          ),
          
          Positioned(
            top: 20,
            left: 20,
            child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
          ) ,
        ],)
        ));
  }
}