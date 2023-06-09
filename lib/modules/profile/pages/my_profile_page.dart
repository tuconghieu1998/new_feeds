import 'package:flutter/material.dart';
import 'package:news_feed/blocs/app_state_bloc.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/modules/profile/blocs/profile_bloc.dart';
import 'package:news_feed/modules/profile/models/user_detail_model.dart';
import 'package:news_feed/modules/profile/widgets/list_post_tab.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/common/widgets/stateless/back_button.dart'
    as BackButton;

enum SelectItem { editProfile, setting, logout }

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with SingleTickerProviderStateMixin {
  ProfileBloc? get bloc => BlocProvider.of<ProfileBloc>(context);
  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void logout() {
    appStateBloc?.logout();
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
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const BackButton.BackButton(),
                  const Spacer(),
                  PopupMenuButton<SelectItem>(
                    offset: const Offset(-30,30),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: ImageIcon(
                        AssetImage(AssetUtils.icoMenu),
                        color: Colors.white,
                      ),
                    ),
                    // Callback that sets the selected popup menu item.
                    onSelected: (SelectItem item) {
                      switch(item) {
                        case SelectItem.logout:
                          logout();
                        break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SelectItem>>[
                      const PopupMenuItem<SelectItem>(
                        value: SelectItem.editProfile,
                        child: Text('Edit Profile'),
                      ),
                      const PopupMenuItem<SelectItem>(
                        value: SelectItem.setting,
                        child: Text('Settings'),
                      ),
                      const PopupMenuItem<SelectItem>(
                        value: SelectItem.logout,
                        child: Text('Log out'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder<UserDetail?>(
                  stream: bloc!.userDetailStream,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      final userDetail = snapshot.data;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Avatar(
                                  url: userDetail?.avatar?.url,
                                  size: 88,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (userDetail?.firstName ?? "") +
                                          (userDetail?.lastName ?? ""),
                                      style: AppStylesText.headLine2
                                          .copyWith(fontSize: 28),
                                    ),
                                    Text(userDetail?.email ?? "",
                                        style: AppStylesText.caption13.copyWith(
                                          color: AppColor.unselectItems,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            children: [
                              Text(
                                userDetail!.counters!.photos.toString(),
                                style: AppStylesText.body15,
                              ),
                              Text(" Photos",
                                  style: AppStylesText.body15.copyWith(
                                    color: AppColor.unselectItems,
                                  )),
                              const Spacer(),
                              Text(
                                userDetail.counters!.followings.toString(),
                                style: AppStylesText.body15,
                              ),
                              Text(" Following",
                                  style: AppStylesText.body15.copyWith(
                                    color: AppColor.unselectItems,
                                  )),
                              Spacer(),
                              Text(
                                userDetail.counters!.followers.toString(),
                                style: AppStylesText.body15,
                              ),
                              Text(" Follower",
                                  style: AppStylesText.body15.copyWith(
                                    color: AppColor.unselectItems,
                                  )),
                            ],
                          )
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration:
              BoxDecoration(color: AppColor.backgroundTabBar, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(0, 1))
          ] // changes position of shadow
                  ),
          child: TabBar(
              labelColor: AppColor.primaryColor,
              unselectedLabelColor: AppColor.unselectItems,
              indicatorColor: Colors.transparent,
              controller: _tabController,
              isScrollable: false,
              tabs: const [
                Tab(
                  icon: ImageIcon(
                    AssetImage(AssetUtils.icoGridView),
                    size: 28,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(AssetUtils.icoPicture),
                    size: 28,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(AssetUtils.icoVideo),
                    size: 28,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(AssetUtils.icoPlayList),
                    size: 28,
                  ),
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: [ListPostTabView(), Text("2"), Text("3"), Text("4")]),
        )
      ],
    );
  }
}
