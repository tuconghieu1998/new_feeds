import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class TextFieldEditWidget extends StatelessWidget {
  const TextFieldEditWidget({super.key, this.header, this.value});

  final String? header;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Text(header ?? "", style: AppStylesText.body17.copyWith(color: AppColor.colorHeaderTextField, fontSize: 17, fontWeight: FontWeight.w400),),
              Spacer(),
              Text(value ?? "", style: AppStylesText.body17.copyWith(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
        const Divide(height: 1, color: Colors.black, opacity: 0.2,)
      ],
    );
  }
}