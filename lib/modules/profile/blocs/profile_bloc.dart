import 'package:news_feed/modules/profile/models/user_detail_model.dart';
import 'package:news_feed/modules/profile/repos/profile_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BlocBase {
  final _userDetailCtrl = BehaviorSubject<UserDetail?>();
  Stream<UserDetail?> get userDetailStream => _userDetailCtrl.stream;

  Future<void> getUserDetail() async {
    try {
      final res = await ProfileRepo().getUserDetail();
      if(res!=null) {
        _userDetailCtrl.sink.add(res);
      }
    }
    catch(e) {
      _userDetailCtrl.sink.addError("Cannot get profile now!");
    }
  }


  @override
  void dispose() {
    _userDetailCtrl.close();
  }

}