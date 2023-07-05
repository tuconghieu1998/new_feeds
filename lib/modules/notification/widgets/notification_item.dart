import 'package:flutter/cupertino.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/modules/notification/models/notification.dart';
import 'package:news_feed/modules/notification/widgets/noti_image_content.dart';
import 'package:news_feed/modules/notification/widgets/noti_standard_content.dart';
import 'package:news_feed/modules/notification/widgets/noti_text_and_image_content.dart';
import 'package:news_feed/themes/styles_text.dart';

enum NotiContentType { standard, image, textAndImage }

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, this.contentType, this.notificationData});

  final NotificationModel? notificationData;

  final NotiContentType? contentType;

  Widget getContentType(NotiContentType contentType) {
    switch (contentType) {
      case NotiContentType.image:
        return const NotiImageContent();
      case NotiContentType.textAndImage:
        return const NotiTextAndImageContent();
      default:
        return const NotiStandardContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 15,
          ),
          const Avatar(
            size: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notificationData?.payload?.title ?? "",
                          style: AppStylesText.body15.bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        getContentType(contentType ?? NotiContentType.standard),
                        const SizedBox(
                          height: 15,
                        ),
                      ]),
                ),
                const Divide()
              ],
            ),
          )
        ],
      ),
    );
  }
}
