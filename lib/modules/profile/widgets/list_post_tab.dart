import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/modules/home/widgets/post_item.dart';

class ListPostTabView extends StatelessWidget {
  const ListPostTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(children: [
          PostItem(),
          SizedBox(height: 15,),
          PostItem(),
          SizedBox(height: 15,),
          PostItem(),
          SizedBox(height: 15,),
        ]),
      ),
    );
  }
}