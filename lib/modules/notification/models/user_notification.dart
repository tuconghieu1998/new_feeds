
import 'package:news_feed/models/avatar_model.dart';

class UserNotification {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  Avatar? avatar;

  UserNotification(
      {this.id, this.username, this.firstName, this.lastName, this.avatar});

  UserNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar =
        json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    return data;
  }
}