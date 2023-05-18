import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/providers/log_provider.dart';
import 'package:news_feed/utils/prefs_key.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppState {loading, unAuthorized, authorized}

class AppStateBloc implements BlocBase {

  final _appState = BehaviorSubject<AppState>.seeded(AppState.loading);
  Stream<AppState> get appState => _appState.stream;
  AppState get appStateValue => _appState.stream.value;
  AppState get initState => AppState.loading;
  String langCode = 'en';
  LogProvider get logger => const LogProvider('AppStateBloc');
  AppStateBloc() {
    laughApp();
  }

  Future<void> laughApp() async {
    final prefs = await SharedPreferences.getInstance();
    final authorLevel = prefs.getInt(Prefskey.authorLevel) ?? 0;
    logger.log("authorLevel $authorLevel");

    switch(authorLevel) {
      case 2:
        await changeAppState(AppState.authorized);
      break;
      default:
        await changeAppState(AppState.unAuthorized);
      break;
    }
  }

  Future<void> changeAppState(AppState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(Prefskey.authorLevel, state.index);
    logger.log('changeAppState $state');
    _appState.sink.add(state);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await changeAppState(AppState.unAuthorized);
  }

  @override
  void dispose() {
    _appState.close();
  }
}