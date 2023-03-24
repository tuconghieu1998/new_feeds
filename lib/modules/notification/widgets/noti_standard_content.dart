import 'package:flutter/cupertino.dart';
import 'package:news_feed/themes/styles_text.dart';

class NotiStandardContent extends StatelessWidget {
  const NotiStandardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("2 hours ago", style: AppStylesText.body15.subColor,);
  }
}