import 'package:news_feed/modules/notification/repos/notification_repo.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../models/notification.dart';

class NotificationBloc extends BlocBase {
  final _notificationCtrl = BehaviorSubject<List<NotificationModel>?>.seeded(const []);
  Stream<List<NotificationModel>?> get notificationStream => _notificationCtrl.stream;

  Future<void> getNotifications() async {
    try {
      // get comment from repo
      final res = await NotificationRepo().getNotifications();
      if(res!=null) {
        _notificationCtrl.sink.add(res);
      }
    }
    catch (e) {
      _notificationCtrl.sink.addError("Cannot fetch list notifications right now");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _notificationCtrl.close();
  }

}