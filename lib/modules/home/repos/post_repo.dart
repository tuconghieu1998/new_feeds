import 'package:news_feed/providers/api_provider.dart';

class PostRepo {
  final _apiProvider = ApiProvider();
  Future<bool> likePost(String postId) async {
    try{
      final res = await _apiProvider.post("/posts/$postId/like");
      return res.statusCode == 200;
    }
    catch(e) {
      return false;
    } 
  }
}