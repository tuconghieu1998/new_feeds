import 'package:flutter/material.dart';
import 'package:news_feed/all_screens.dart';
import 'package:news_feed/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff242A37)
      ),
      home: const AllScreens(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}