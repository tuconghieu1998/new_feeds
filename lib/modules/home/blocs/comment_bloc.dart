import 'package:news_feed/modules/home/models/comment.dart';
import 'package:news_feed/modules/home/repos/comment_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CommentBloc extends BlocBase {
  final _commentsCtrl = BehaviorSubject<List<Comment>?>.seeded(const[]);
  Stream<List<Comment>?> get commentsStream => _commentsCtrl.stream;

  Future<void> getComments(String postId) async {
    try {
      final res = await CommentRepo().getComments(postId);
      if(res!=null) {
        _commentsCtrl.sink.add(res);
      }
    }
    catch(e) {
      _commentsCtrl.sink.addError("Cannot fetch list comments right now");
    }
  }

  @override
  void dispose() {
    _commentsCtrl.close();
  }

}