import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/notification/widgets/notification_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const TopBarWidget(title: "Notifications",),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: const [
              NotificationItem(contentType: NotiContentType.standard,),
              NotificationItem(contentType: NotiContentType.image),
              NotificationItem(contentType: NotiContentType.textAndImage),
            ]),
          ),
        )
      ]),
    );
  }
}