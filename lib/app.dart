import 'package:flutter/material.dart';
import 'package:news_feed/blocs/app_state_bloc.dart';
import 'package:news_feed/modules/authentication/blocs/authentication_bloc.dart';
import 'package:news_feed/modules/authentication/wrapper/service/app_auth_service.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/routes/routes.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appStateBloc = AppStateBloc();
  late AuthenticationBloc _authenticationBloc;
  static final GlobalKey<State> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(AppAuthService());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: appStateBloc,
      child: StreamBuilder<AppState>(
          stream: appStateBloc.appState,
          initialData: appStateBloc.initState,
          builder: (context, snapshot) {
            if (snapshot.data == AppState.loading) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Container(
                  color: Colors.white,
                ),
              );
            }
            if (snapshot.data == AppState.unAuthorized) {
              return BlocProvider(
                bloc: _authenticationBloc,
                child: MaterialApp(
                  key: const ValueKey('UnAuthorized'),
                  themeMode: ThemeMode.light,
                  builder: _builder,
                  // initialRoute: RouteName.welcomePage,
                  onGenerateRoute: Routes.unAuthorizedRoute,
                  debugShowCheckedModeBanner: false,
                ),
              );
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: Routes.authorizedRoute,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Color(0xff242A37)
              ),
              key: key,
              builder: _builder,
              navigatorKey: MyApp.navigatorKey,
            );
          }),
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: child!,
    );
  }
}
