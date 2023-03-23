import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_feed/constants.dart';
import 'package:news_feed/modules/category/models/category_model.dart';

class CategoryNetwork {
  static Future<List<Category>> getTrendingMovies() async {
    final dio = Dio();
    final response = await dio.get("${AppContants.apiDomain}/v1/categories");
    List<Category> categories = [];
    if(response.statusCode == 200) {
      final results = response.data["data"] as List<dynamic>;
      categories = results.map((model) => Category.fromJson(model)).toList();
    }
    return categories;
  }
}