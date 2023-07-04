import 'package:flutter/material.dart';
import 'package:news_feed/app.dart';
import 'package:news_feed/config_env.dart';
import 'package:news_feed/modules/firebase/widgets/firebase_initializer.dart';

void main() {
  ConfigEnv.appFlavor = Flavor.staging;
  runApp(const FirebaseInitializer(child: MyApp()));
  // runApp(
  //   MyApp(),
  // );
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Color(0xff242A37)
//       ),
//       home: const MyApp(),
//       debugShowCheckedModeBanner: false,
//       routes: routes,
//     );
//   }
// }