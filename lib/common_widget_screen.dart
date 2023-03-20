import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommonWidgetScreen extends StatefulWidget {
  const CommonWidgetScreen({super.key});

  static const String routeName = "/common_widget";

  @override
  State<CommonWidgetScreen> createState() => _CommonWidgetScreenState();
}

class _CommonWidgetScreenState extends State<CommonWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 100,),
              Text("AAAAAAAAAAAAAAAAAAAAAA"),
              Text("AAAAAAAAAAAAAAAAAAAAAA"),
              Text("AAAAAAAAAAAAAAAAAAAAAA"),
              Text("AAAAAAAAAAAAAAAAAAAAAA")
            ]),
          ),
          ),
          
          Positioned(
            top: 20,
            left: 20,
            child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
          ) ,
        ],)
        ));
  }
}