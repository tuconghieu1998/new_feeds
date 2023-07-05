import 'package:news_feed/modules/notification/models/accesories.dart';
import 'package:news_feed/modules/notification/models/user_notification.dart';
import 'notification_item.dart';

class NotificationPayload {
  UserNotification? user;
  String? title;
  List<NotificationItemModel>? items;
  Accessories? accessories;

  NotificationPayload({this.user, this.title, this.items, this.accessories});

  NotificationPayload.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserNotification.fromJson(json['user']) : null;
    title = json['title'];
    if (json['items'] != null) {
      items = <NotificationItemModel>[];
      json['items'].forEach((v) {
        items!.add(NotificationItemModel.fromJson(v));
      });
    }
    if(json['accessories'] != null) {
      accessories = Accessories.fromJson(json['accessories']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user?.toJson();
    data['title'] = this.title;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (accessories != null) {
      data['accessories'] = accessories!.toJson();
    }
    return data;
  }
}