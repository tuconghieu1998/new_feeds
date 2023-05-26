import 'package:dio/dio.dart';
import 'package:news_feed/modules/home/models/post.dart';
import 'package:news_feed/providers/api_provider.dart';

class HomeFeedRepo {
  final _apiProvider = ApiProvider();

  Future<List<Post>?> getPosts() async {
    try {
      final res = await Dio(BaseOptions(
        baseUrl: 'https://api.dofhunt.200lab.io', connectTimeout: 3000))
        .get(
          "/v1/homefeeds?page=1",
          options: Options(method: 'get', headers: {
            'Authorization': "Bearer " + "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJlbWFpbCI6InR1Y29uZ2hpZXUxNTEyQGdtYWlsLmNvbSIsImV4cCI6MTY4NjY2NTYwNiwiaWF0IjoxNjg0MDczNjA2LCJpc3MiOiIiLCJqdGkiOiI1YTZjNzdkZi0wZGJjLTQ5MWEtOTc5Ny1kMWIyMmI1Y2EzMzQiLCJuYmYiOjE2ODQwNzM2MDYsInNjcCI6WyJvZmZsaW5lIl0sInN1YiI6IjcyMzciLCJ1c2VyX2lkIjoiNzIzNyJ9.h1p3GJGNaPWk6Mxf1UpIFfM0iVZwLwWBoYo2Fv1ikYMDrkVc4dVva20qovxAjgSsuq0wAeJwjI40PX3yOSTVzEykLIHPJirYNaoSz60urGQPh3n4saBOQ7UnCOOdEVOiklUisGQGfvT4l7E43rvgZ_zzZUy1LZt9yVbbE2jBeYM",
          "Content-Type": "application/json"
          })
          );
      // final res = await _apiProvider.get(
      //   "/v1/homefeeds?page=1",
      //     options: Options(method: 'get', headers: {
      //       'Authorization': "Bearer " + "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOltdLCJlbWFpbCI6InR1Y29uZ2hpZXUxNTEyQGdtYWlsLmNvbSIsImV4cCI6MTY4NjY2NTYwNiwiaWF0IjoxNjg0MDczNjA2LCJpc3MiOiIiLCJqdGkiOiI1YTZjNzdkZi0wZGJjLTQ5MWEtOTc5Ny1kMWIyMmI1Y2EzMzQiLCJuYmYiOjE2ODQwNzM2MDYsInNjcCI6WyJvZmZsaW5lIl0sInN1YiI6IjcyMzciLCJ1c2VyX2lkIjoiNzIzNyJ9.h1p3GJGNaPWk6Mxf1UpIFfM0iVZwLwWBoYo2Fv1ikYMDrkVc4dVva20qovxAjgSsuq0wAeJwjI40PX3yOSTVzEykLIHPJirYNaoSz60urGQPh3n4saBOQ7UnCOOdEVOiklUisGQGfvT4l7E43rvgZ_zzZUy1LZt9yVbbE2jBeYM",
      //     "Content-Type": "application/json"
      //     }),
      // );
      
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