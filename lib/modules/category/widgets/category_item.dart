import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/modules/category/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, this.category });

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Name: ${category?.title}"),
        Text("Status: ${category?.status}"),
        Text("Description: ${category?.description}"),
        Text("Photos count: ${category?.photoCounts}"),
      ]),
    );
  }
}