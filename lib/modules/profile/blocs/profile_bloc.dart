import 'package:news_feed/modules/profile/models/user_detail_model.dart';
import 'package:news_feed/modules/profile/repos/profile_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ProfileBloc extends BlocBase {
  final _userDetailCtrl = BehaviorSubject<UserDetail?>();
  Stream<UserDetail?> get userDetailStream => _userDetailCtrl.stream;
  UserDetail? get dataValue => _userDetailCtrl.stream.value;

    String? _tokenFirebaseMessaging;

    void createTokenFirebaseMessaging(username) async {
    await FirebaseMessaging.instance.getToken().then((token) {
      _tokenFirebaseMessaging = token;
      saveToken(username, token!);
    });
  }

  void saveToken(String username, String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc(username).set({
      'token': token,
    });
  }

  Future<void> getUserDetail() async {
    try {
      final res = await ProfileRepo().getUserDetail();
      if(res!=null) {
        _userDetailCtrl.sink.add(res);
        // TODO: handle save token firebase
        createTokenFirebaseMessaging(res.username);
      }
    }
    catch(e) {
      _userDetailCtrl.sink.addError("Cannot get profile now!");
    }
  }

  bool isMine(String username) {
    return dataValue?.username == username;
  } 


  @override
  void dispose() {
    _userDetailCtrl.close();
  }

}