import 'package:news_feed/models/avatar_model.dart';

class NotificationItemModel {
  String? title;
  String? description;
  Avatar? thumbnail;

  NotificationItemModel({this.title, this.description, this.thumbnail});

  NotificationItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'] != null
        ? Avatar.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail?.toJson();
    }
    return data;
  }
}
