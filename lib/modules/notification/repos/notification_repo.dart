import 'package:news_feed/modules/notification/models/notification.dart';
import 'package:news_feed/providers/api_provider.dart';

class NotificationRepo {
  final _apiProvider = ApiProvider();

  Future<List<NotificationModel>?> getNotifications() async {
    try {
      // final res = await _apiProvider.get('/v1/notifications');
      // if(res.statusCode != 200) {
      //   return null;
      // }
      // List data = res.data['data'];
      final data = [
        {
            "id": "43b6gztwrYjfMt",
            "status": 1,
            "created_at": "2019-10-06T14:57:28+00:00",
            "updated_at": "2019-10-06T19:11:58+00:00",
            "user_id": "iUwwxcPcTmHc",
            "event": 0,
            "actor_id": "iUwwxcPcTmHc",
            "actor_type": "user",
            "receiver_id": "5BcFbawho19m91oU24",
            "receiver_type": "user",
            "is_read": 1,
            "pushed": 0,
            "payload": {
                "user": {
                    "id": 3,
                    "username": "charlpost",
                    "first_name": "Charles",
                    "last_name": "Postiaux",
                    "avatar": {
                        "url": "https://dofhunt.imgix.net/avatar/1568944217425632000.jpg",
                        "org_width": 600,
                        "org_height": 600,
                        "org_url": "https://dofhunt.s3.amazonaws.com/avatar/1568944217425632000.jpg",
                        "dominant_color": ""
                    }
                },
                "title": "Charles Postiaux liked your photo",
                "items": [
                    {
                        "title": "Charles Postiaux liked your photo",
                        "description": "",
                        "thumbnail": {
                            "url": "https://dofhunt.imgix.net/photo/1569480893305466000.jpg",
                            "org_width": 2048,
                            "org_height": 1365,
                            "org_url": "https://dofhunt.s3.amazonaws.com/photo/1569480893305466000.jpg",
                            "dominant_color": "#FDC970"
                        }
                    }
                ],
                "accessories": {
                    "model": "",
                    "model_id": 0,
                    "thumbnail": null
                }
            }
        },
      ];
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    }
    catch(e) {
      print(e);
      rethrow;
    }
  } 
}