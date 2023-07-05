import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/top_bar_widget.dart';
import 'package:news_feed/modules/notification/blocs/notification_bloc.dart';
import 'package:news_feed/modules/notification/models/notification.dart';
import 'package:news_feed/modules/notification/widgets/notification_item.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationBloc? get notificationBloc =>
      BlocProvider.of<NotificationBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const TopBarWidget(
          title: "Notifications",
        ),
        Expanded(
          child: StreamBuilder<List<NotificationModel>?>(
              stream: notificationBloc!.notificationStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final notifications = snapshot.data;
                  if (notifications!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (_, int index) {
                        return NotificationItem(
                          contentType: NotiContentType.standard,
                          notificationData: notifications[index],
                        );
                      },
                    );
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 150),
                      child: Text(
                        "Not Notifications yet",
                        style: AppStylesText.body20.copyWith(
                            fontSize: 15, color: AppColor.unselectItems),
                      ),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        )
        // child: SingleChildScrollView(
        //   child: Column(children: const [
        //     NotificationItem(contentType: NotiContentType.standard,),
        //     NotificationItem(contentType: NotiContentType.image),
        //     NotificationItem(contentType: NotiContentType.textAndImage),
        //   ]),
        // ),
      ]),
    );
  }
}
