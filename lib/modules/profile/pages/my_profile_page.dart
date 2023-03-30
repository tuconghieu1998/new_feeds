import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/modules/profile/widgets/list_post_tab.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/common/widgets/stateless/back_button.dart' as BackButton;

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15,),
              const BackButton.BackButton(),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(children: [
                  const Avatar(size: 88,),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Blanche Hall", style: AppStylesText.headLine2.copyWith(fontSize: 28),),
                    Text("@jorgecutis", style: AppStylesText.caption13.copyWith(color: AppColor.unselectItems,))
                  ],)
                ],),
              ),
              const SizedBox(height: 35,),
              Row(children: [
                Text("128", style: AppStylesText.body15,),
                Text(" Posts", style: AppStylesText.body15.copyWith(color: AppColor.unselectItems,)),
                Spacer(),
                Text("3120", style: AppStylesText.body15,),
                Text(" Following", style: AppStylesText.body15.copyWith(color: AppColor.unselectItems,)),
                Spacer(),
                Text("5024", style: AppStylesText.body15,),
                Text(" Follower", style: AppStylesText.body15.copyWith(color: AppColor.unselectItems,)),
              ],)
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            color: AppColor.backgroundTabBar,
            boxShadow: [
              BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            offset: const Offset(0, 1))] // changes position of shadow
          ),
          child: TabBar(
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.unselectItems,
            indicatorColor: Colors.transparent,
            controller: _tabController,
            isScrollable: false,
            tabs: const [
              Tab(icon: ImageIcon(AssetImage(AssetUtils.icoGridView), size: 28,),),
              Tab(icon: ImageIcon(AssetImage(AssetUtils.icoPicture), size: 28,),),
              Tab(icon: ImageIcon(AssetImage(AssetUtils.icoVideo), size: 28,),),
              Tab(icon: ImageIcon(AssetImage(AssetUtils.icoPlayList), size: 28,),),
            ]),
        ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListPostTabView(),
                Text("2"),
                Text("3"),
                Text("4")
            ]),
          )
      ],
    );
  }
}