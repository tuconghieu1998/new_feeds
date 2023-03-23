import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/app_sizes.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/string_utils.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, this.avatarUrl, this.name, this.message, this.createdAt, this.replyCount});

  final String? avatarUrl;
  final String? name;
  final String? message;
  final String? createdAt;
  final int? replyCount;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Avatar(
              size: AppSizes.avatarSize,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$name",
                          style: AppStylesText.body17.copyWith(fontSize: 17),
                        ),
                        Text(StringUtils.formatTimeChatMessage(createdAt ?? ""),
                            style: AppStylesText.body15.copyWith(
                              color: AppColor.unselectItems,
                              fontSize: 13
                            ))
                      ],
                    ),
                    Text(
                      "$message",
                      style:
                          AppStylesText.body17.regular.copyWith(fontSize: 17),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divide(height: 1, color: Colors.black)
            ],
          ))
        ],
      );
  }
}
