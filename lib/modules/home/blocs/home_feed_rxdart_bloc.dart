import 'package:news_feed/modules/home/models/post.dart';
import 'package:news_feed/modules/home/repos/home_feed_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeFeedRxDartBloc extends BlocBase {
  final _postsCtrl = BehaviorSubject<List<Post>?>.seeded(const []);
  Stream<List<Post>?> get postsStream => _postsCtrl.stream;

  Future<void> getPosts() async {
    try {
      final res = await HomeFeedRepo().getPosts();
      if(res!= null) {
        _postsCtrl.sink.add(res);
      }
    }
    catch(e) {
      _postsCtrl.sink.addError("Cannot fetch list posts right now!!!");
    } 
  }
 
  @override
  void dispose() {
    _postsCtrl.close();
  }
}