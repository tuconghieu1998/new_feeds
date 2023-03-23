import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common_widget_screen.dart';
import 'package:news_feed/modules/category/pages/list_category.dart';
import 'package:news_feed/modules/main_app.dart';

class AllScreens extends StatefulWidget {
  const AllScreens({super.key});

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("All Screens"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CommonWidgetScreen.routeName);
              },
              child: const Text("CommonWidgetPage"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MainApp.routeName);
              },
              child: const Text("Navigation"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ListCategory.routeName);
              },
              child: const Text("Category"),
            ),
          ]),
        ),
      ),
    );
  }
}
