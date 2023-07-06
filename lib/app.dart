
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_feed/blocs/app_state_bloc.dart';
import 'package:news_feed/modules/authentication/blocs/authentication_bloc.dart';
import 'package:news_feed/modules/authentication/wrapper/service/app_auth_service.dart';
import 'package:news_feed/providers/bloc_provider.dart';
import 'package:news_feed/routes/routes.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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
  String? mtoken;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(AppAuthService());
    requestPermission();
    // getToken();
    initInfo();
  }

  initInfo() {
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationsSettings = InitializationSettings(android: androidInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings, onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
          print("onDidReceiveNotificationResponse");
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          // selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          // if (notificationResponse.actionId == navigationActionId) {
          //   selectNotificationStream.add(notificationResponse.payload);
          // }
          try {
            if(notificationResponse.payload != null && notificationResponse.payload!.isNotEmpty) {

            }
            else {

            }
          }
          catch(e) {

          }
          break;
      }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async { 
    print("................. onMessage................");
    print("onMessage: ${message.notification?.title}/${message.notification?.body}");

    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      message.notification!.body.toString(), htmlFormatBigText: true,
      contentTitle: message.notification!.title.toString(), htmlFormatContentTitle: true
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'cherry_id', 'cherry_name', importance: Importance.high,
      styleInformation: bigTextStyleInformation, priority: Priority.high, playSound: true
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, message.notification?.title, message.notification?.body, notificationDetails,
        payload: 'item x');
  });
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print("My token is $mtoken");
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
      'token': token,
    });
  }

  void requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true
  );

  if(settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("User granted permission");
  }
  else if(settings.authorizationStatus == AuthorizationStatus.provisional) {
    print("User granted provisional permission");
  }
  else {
    print("User declined or has not accepted permisison");
  }
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
