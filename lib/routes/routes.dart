import 'package:flutter/material.dart';
import 'package:news_feed/common_widget_screen.dart';
import 'package:news_feed/modules/main_app.dart';

final Map<String, WidgetBuilder> routes = {
  CommonWidgetScreen.routeName: (context) => const CommonWidgetScreen(),
  MainApp.routeName: (context) => const MainApp(),
};