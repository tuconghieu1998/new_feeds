import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class TextFieldEditWidget extends StatelessWidget {
  const TextFieldEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Text("Username", style: AppStylesText.body17.copyWith(color: AppColor.colorHeaderTextField, fontSize: 17, fontWeight: FontWeight.w400),),
              Spacer(),
              Text("Darrell Bailey", style: AppStylesText.body17.copyWith(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
        const Divide(height: 1, color: Colors.black, opacity: 0.2,)
      ],
    );
  }
}