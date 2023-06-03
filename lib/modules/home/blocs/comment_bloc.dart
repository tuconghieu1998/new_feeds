import 'dart:async';

import 'package:news_feed/blocs/app_event_bloc.dart';
import 'package:news_feed/modules/home/models/comment.dart';
import 'package:news_feed/modules/home/repos/comment_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CommentBloc extends BlocBase {
  final _commentsCtrl = BehaviorSubject<List<Comment>?>.seeded(const[]);
  Stream<List<Comment>?> get commentsStream => _commentsCtrl.stream;

  late final StreamSubscription<BlocEvent> _onPostCommentSub;

  CommentBloc() {
    _onPostCommentSub = AppEventBloc().listenEvent(
      eventName: EventName.postComment, 
      handler: _onPostComment 
    );
  }

  void _onPostComment(BlocEvent evt) {
    getComments(evt.value);
    // TODO: handle on post comment, extend class paging
  }

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

  Future<bool> postComment(String postId, String content, List<String> taggedUserIds) async {
    try {
      final data = {"content": content, "tagged_user_ids": taggedUserIds};
      final res = await CommentRepo().postComment(postId, data);

      if(res) {
        AppEventBloc().emitEvent(BlocEvent(EventName.postComment, postId));
      }

      return res;
    }
    catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _commentsCtrl.close();
    _onPostCommentSub.cancel();
  }

}