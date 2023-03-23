import 'package:flutter/material.dart';
import 'package:news_feed/common_widget_screen.dart';
import 'package:news_feed/modules/category/pages/list_category.dart';
import 'package:news_feed/modules/main_app.dart';

final Map<String, WidgetBuilder> routes = {
  CommonWidgetScreen.routeName: (context) => const CommonWidgetScreen(),
  MainApp.routeName: (context) => const MainApp(),
  ListCategory.routeName: (context) => const ListCategory(),
};