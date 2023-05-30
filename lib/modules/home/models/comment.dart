import 'package:news_feed/models/image_model.dart';
import 'package:news_feed/modules/home/models/comment_user.dart';

class Comment {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? content;
  String? replyForId;
  CommentUser? user;
  ImageModel? image;
  bool? liked;
  // Null replyComments;

  Comment(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.content,
      this.replyForId,
      this.user,
      this.image,
      this.liked,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    content = json['content'];
    replyForId = json['reply_for_id'];
    if (json['user'] != null) {
      user = CommentUser.fromJson(json['user']);
    } else {
      user = null;
    }
    image = json['image'];
    liked = json['liked'];
    // replyComments = json['reply_comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['content'] = content;
    data['reply_for_id'] = replyForId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['image'] = image;
    data['liked'] = liked;
    // data['reply_comments'] = this.replyComments;
    return data;
  }
}
