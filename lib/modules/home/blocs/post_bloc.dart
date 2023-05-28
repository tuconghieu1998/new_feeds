import 'package:news_feed/modules/home/repos/post_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends BlocBase {
  
  Future<bool?> likePost(String postId) async {
    try {
      print("likePost$postId");
      final res = await PostRepo().likePost(postId);
      return res == true;
    }
    catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}