import 'package:news_feed/models/avatar_model.dart';
import 'package:news_feed/models/config_model.dart';
import 'counters_model.dart';
import 'point_model.dart';
import 'profile_model.dart';

class UserDetail {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phonePrefix;
  String? phone;
  String? gender;
  String? dob;
  Avatar? avatar;
  int? totalPoints;
  int? balancePoints;
  String? systemRole;
  int? scores;
  bool? isVerified;
  Profile? profile;
  Counters? counters;
  Config? config;
  Point? point;
  bool? followed;

  UserDetail(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phonePrefix,
      this.phone,
      this.gender,
      this.dob,
      this.avatar,
      this.totalPoints,
      this.balancePoints,
      this.systemRole,
      this.scores,
      this.isVerified,
      this.profile,
      this.counters,
      this.config,
      this.point,
      this.followed});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phonePrefix = json['phone_prefix'];
    phone = json['phone'];
    gender = json['gender'];
    dob = json['dob'];
    avatar =
        json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    totalPoints = json['total_points'];
    balancePoints = json['balance_points'];
    systemRole = json['system_role'];
    scores = json['scores'];
    isVerified = json['is_verified'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    counters = json['counters'] != null
        ? Counters.fromJson(json['counters'])
        : null;
    config =
        json['config'] != null ? Config.fromJson(json['config']) : null;
    point = json['point'] != null ? Point.fromJson(json['point']) : null;
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_prefix'] = phonePrefix;
    data['phone'] = phone;
    data['gender'] = gender;
    data['dob'] = dob;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    data['total_points'] = totalPoints;
    data['balance_points'] = balancePoints;
    data['system_role'] = systemRole;
    data['scores'] = scores;
    data['is_verified'] = isVerified;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    if (counters != null) {
      data['counters'] = counters!.toJson();
    }
    if (config != null) {
      data['config'] = config!.toJson();
    }
    if (point != null) {
      data['point'] = point!.toJson();
    }
    data['followed'] = followed;
    return data;
  }
}