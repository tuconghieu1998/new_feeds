import 'package:dio/dio.dart';
import 'package:news_feed/modules/home/models/post.dart';
import 'package:news_feed/providers/api_provider.dart';

class HomeFeedRepo {
  final _apiProvider = ApiProvider();

  Future<List<Post>?> getPosts() async {
    try {
      // final res = await Dio(BaseOptions(
      //   baseUrl: 'https://api.dofhunt.200lab.io', connectTimeout: 3000))
      //   .get(
      //     "v1/homefeeds",
      //     queryParameters: {'tags': "portrait"},
      //     options: Options(method: 'get', headers: {
      //       'Authorization': "Bearer " + userToken,
      //     "Content-Type": "application/json"
      //     })
      //     );
      final res = await _apiProvider.get(
        "v1/homefeeds",
        queryParameters: {'tags': "portrait"}
      );
      
      if(res.statusCode != 200) {
        return null;
      }

      List data = res.data['data'];
      return data.map((json) => Post.fromJson(json)).toList();
    }
    catch (e) {
      rethrow;
    }
  }
}