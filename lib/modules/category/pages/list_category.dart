import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/modules/category/models/category_model.dart';
import 'package:news_feed/modules/category/network/category_network.dart';
import 'package:news_feed/modules/category/widgets/category_item.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({super.key});

  static const String routeName = "/list_category";

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {

  List<Category> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryNetwork.getTrendingMovies().then((value) {
      setState(() {
        categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category")),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index],);
      })
    );
  }
}
