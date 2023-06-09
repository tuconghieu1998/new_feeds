import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/common/widgets/stateless/avatar.dart';
import 'package:news_feed/modules/profile/widgets/text_field_edit_widget.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static const String routeName = "/edit_profile";

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  const BackButton(
                    color: Colors.white,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {  },
                    child: Text("Done", style: AppStylesText.body17.copyWith(color: AppColor.primaryColor, fontSize: 17),)
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Text("Edit Profile", style: AppStylesText.headLine1.copyWith(fontSize: 37),),
              const SizedBox(height: 40,),
              Row(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Avatar(size: 165),
                      TextButton(
                    onPressed: () {  },
                    child: Text("Change profile photo", style: AppStylesText.body17.copyWith(color: AppColor.primaryColor, fontSize: 17, fontWeight: FontWeight.w400),)
                  )
                    ],
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(height: 50,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldEditWidget()
                    ],
                  )
                ))
            
            ],
          ),
        ),
      )
      
      );
  }
}