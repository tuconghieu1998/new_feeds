import 'package:flutter/foundation.dart';
import 'package:news_feed/providers/api_provider.dart';
import 'package:news_feed/providers/log_provider.dart';
import 'package:news_feed/utils/model_type.dart';

abstract class CanLikeRepo {
  Future<bool> like(String id);

  Future<bool> unlike(String id);
}

class LikeRepo implements CanLikeRepo {
  final _apiProvider = ApiProvider();
  final String likeUrl;
  final String unlikeUrl;

  LogProvider get logger => const LogProvider('LikeRepo');

  LikeRepo._internal(this.likeUrl, this.unlikeUrl);

  factory LikeRepo(ModelType type) {
    switch(type) {
      case ModelType.post:
        return LikeRepo._internal("/posts/:id/like", "/posts/:id/unlike");
      default:
        return LikeRepo._internal("/comments/:id/like", "/comments/:id/unlike");
    }
  }

  @override
  Future<bool> like(String id) async {
    final url = likeUrl.replaceFirst(":id", id);
    logger.log("calling api $url");
    try {
      var res = await _apiProvider.post(url);
      return res.statusCode == 200;
    }
    catch(e) {
      return false;
    } 

  }

  @override
  Future<bool> unlike(String id) async {
    final url = unlikeUrl.replaceFirst(":id", id);
    logger.log("calling api $url");
    try {
      var res = await _apiProvider.post(url);
      return res.statusCode == 200;
    }
    catch(e) {
      return false;
    }
  }

}