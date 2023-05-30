import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateful/toggle.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/modules/home/blocs/post_bloc.dart';
import 'package:news_feed/modules/home/models/post.dart';
import 'package:news_feed/modules/home/pages/comment_page.dart';
import 'package:news_feed/modules/home/widgets/action_post_item.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/providers/log_provider.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/utils/image_utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key, this.data});

  final Post? data;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  LogProvider get logger => const LogProvider("PostItem");
  Post? get data => widget.data;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = data?.liked ?? false;
  }

  @override
  void didUpdateWidget(covariant PostItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    isLiked = widget.data?.liked ?? false;
  }

  Future<void> _handleLikePost(bool isLiked) async {
    // !isLiked ? await likeBloc.unlike(post.id!) : await likeBloc.like(post.id!);

    // final event =
    //     !isLiked ? EventName.unLikePostDetail : EventName.likePostDetail;

    // AppEventBloc().emitEvent(BlocEvent(event, post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.divideColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              (data?.images != null && data!.images!.isNotEmpty)
                  ? ImageUtils.loadImgUrl(data!.images![0].url ?? "",
                      width: double.infinity,
                      height: 245,
                      fit: BoxFit.cover,
                      radius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)))
                  : ImageUtils.loadFromAsset(AssetUtils.imgPost,
                      width: double.infinity,
                      height: 245,
                      fit: BoxFit.fill,
                      radius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
              Container(
                width: double.infinity,
                height: 245,
                decoration:
                    const BoxDecoration(gradient: AppColor.scrimDarkerBottom30),
              ),
              Positioned(
                  bottom: 15,
                  left: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Avatar(
                        url: data?.user?.avatar?.url,
                        size: 45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data?.user?.lastName ?? "") +
                                (data?.user?.firstName ?? ""),
                            style: AppStylesText.body17
                                .copyWith(fontSize: 17, height: 17 / 17),
                          ),
                          Text(
                              timeago.format(data?.createdAt != null
                                  ? DateTime.parse(data?.createdAt ?? "")
                                  : DateTime.now()),
                              style: AppStylesText.caption13.copyWith(
                                  color: Colors.white.withOpacity(0.7),
                                  height: 18 / 13))
                        ],
                      )
                    ],
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "#relax",
                    style: AppStylesText.body15.tagColor,
                  ),
                  Text(
                    ", ",
                    style: AppStylesText.body15.tagColor,
                  ),
                  Text(
                    "#travel",
                    style: AppStylesText.body15.tagColor,
                  )
                ],
              ),
              Text(
                //"""Coventry is a city with a thousand years of history that has plenty to offer the visiting tourist. Located in the heart of Warwickshire, which is well-known as Shakespeare’s county.""",
                data?.description ?? "",
                style: AppStylesText.body15,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Toggle(
                    isActivated: isLiked,
                    deActivatedChild: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(8),
                      child: const ImageIcon(AssetImage(AssetUtils.icoHeart),
                          color: Colors.white, size: 24),
                    ),
                    activatedChild: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(8),
                      child: const ImageIcon(AssetImage(AssetUtils.icoHeart),
                          color: AppColor.primaryColor, size: 24),
                    ),
                    onTrigger: _handleLikePost,
                    onTap: (isOn) {
                      setState(() {
                        // likeCount = isOn ? likeCount + 1 : likeCount - 1;
                        isLiked = isOn;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  ActionPostItem(
                    iconString: AssetUtils.icoComment,
                    count: data?.commentCounts ?? 0,
                    onTap: () {
                      if (data?.id == null) return;
                      Navigator.of(context).pushNamed(CommentPage.routeName,
                          arguments: {"postId": data?.id});
                    },
                  ),
                  Spacer(),
                  ActionPostItem(
                    iconString: AssetUtils.icoLeft,
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
