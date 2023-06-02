import 'package:flutter/material.dart';

mixin ScrollPageMixin<T extends StatefulWidget> on State<T> {
  ScrollController get scrollController;

  void loadMoreData();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print("indexscroll ${scrollController.position.extentAfter}, ${scrollController.position.extentBefore}");
      if(scrollController.position.extentAfter < 500 &&
        scrollController.position.extentBefore > 100) {
          loadMoreData();
        }
    });

    @override
    void dispose() {
      super.dispose();
    }
  }
}