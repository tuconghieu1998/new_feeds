import 'package:dio/dio.dart';
import 'package:news_feed/config_env.dart';
import 'package:news_feed/constants.dart';
import 'package:news_feed/modules/home/models/comment.dart';

class CommentRepo {
  Future<List<Comment>?> getComments(String postId) async {
    try {
      final res = await Dio(BaseOptions(
        baseUrl: ConfigEnv.getDomainAPI(), connectTimeout: 3000))
        .get(
          "/v1/posts/$postId/comments",
          options: Options(method: 'get', headers: {
            'Authorization': "Bearer " + AppContants.ACCESS_TOKEN,
            'Content-Type': 'application/json'
          })
        );
      
      if(res.statusCode != 200) {
        return null;
      }

      List data = res.data['data'];
      return data.map((json) => Comment.fromJson(json)).toList();
    }
    catch (e) {
      rethrow;
    }
  }
}