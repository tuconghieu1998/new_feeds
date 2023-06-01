import 'package:news_feed/modules/home/repos/like_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';

class LikeBloc extends BlocBase {
  final CanLikeRepo likeRepo;

  LikeBloc(this.likeRepo);

  Future<bool> like(String id) => likeRepo.like(id);

  Future<bool> unlike(String id) => likeRepo.unlike(id);

  @override
  void dispose() {
  }
}