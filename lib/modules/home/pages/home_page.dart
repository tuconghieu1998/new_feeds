import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateful/search_bar.dart';
import 'package:news_feed/common/widgets/stateless/circle_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: const [
              Expanded(child: SearchBar()),
              SizedBox(width: 15,),
              CircleIconButton()
            ],
          ),
        )
      ],
    );
  }
}