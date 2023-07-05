import 'package:news_feed/modules/notification/models/notification_payload.dart';

class Notification {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? userId;
  int? event;
  String? actorId;
  String? actorType;
  String? receiverId;
  String? receiverType;
  int? isRead;
  int? pushed;
  NotificationPayload? payload;

  Notification(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.event,
      this.actorId,
      this.actorType,
      this.receiverId,
      this.receiverType,
      this.isRead,
      this.pushed,
      this.payload});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    event = json['event'];
    actorId = json['actor_id'];
    actorType = json['actor_type'];
    receiverId = json['receiver_id'];
    receiverType = json['receiver_type'];
    isRead = json['is_read'];
    pushed = json['pushed'];
    payload =
        json['payload'] != null ? NotificationPayload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['event'] = event;
    data['actor_id'] = actorId;
    data['actor_type'] = actorType;
    data['receiver_id'] = receiverId;
    data['receiver_type'] = receiverType;
    data['is_read'] = isRead;
    data['pushed'] = pushed;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}