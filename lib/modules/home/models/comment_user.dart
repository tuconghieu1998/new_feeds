import 'package:news_feed/models/avatar_model.dart';

class CommentUser {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  Avatar? avatar;
  String? systemRole;
  bool? isVerified;
  String? createdAt;

  CommentUser(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.avatar,
      this.systemRole,
      this.isVerified,
      this.createdAt});

  CommentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar =
        json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    systemRole = json['system_role'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
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
    data['system_role'] = systemRole;
    data['is_verified'] = isVerified;
    data['created_at'] = createdAt;
    return data;
  }
}