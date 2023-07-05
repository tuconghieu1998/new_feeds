import 'package:news_feed/models/user_model.dart';
import 'package:news_feed/modules/notification/models/accesory.dart';
import 'notification_item.dart';

class NotificationPayload {
  User? user;
  String? title;
  List<NotificationItemModel>? items;
  List<Accessory>? accessories;

  NotificationPayload({this.user, this.title, this.items, this.accessories});

  NotificationPayload.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    title = json['title'];
    if (json['items'] != null) {
      items = <NotificationItemModel>[];
      json['items'].forEach((v) {
        items!.add(NotificationItemModel.fromJson(v));
      });
    }
    if(json['accessories'] != null) {
      accessories = <Accessory>[];
      json['accessories'].forEach((v) {
        accessories!.add(Accessory.fromJson(v));
      });
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
      data['accessories'] = accessories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}