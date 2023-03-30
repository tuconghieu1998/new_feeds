import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../common/widgets/stateless/common_text_field.dart';
import '../../../common/widgets/stateless/flex_button.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/styles_text.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/image_utils.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  static const String routeName = "/create_account";

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ImageUtils.loadFromAsset(AssetUtils.backgroundImage4,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                gradient: AppColor.scrimDarkerTop30Bottom100),
          )),
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SizedBox(
                height: 28,
                width: 28,
                child: Center(child: ImageIcon(AssetImage(AssetUtils.icoArrowLeft), color: Colors.white, size: 28,)),
              ),
            )
            ),
          Positioned(
            top: 150,
          left: 0,
          right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an account",
                    style: AppStylesText.headLine1.copyWith(fontSize: 34),
                  ),
                  const SizedBox(height: 70,),
                  const CommonTextField(
                    placeHolder: "Username",
                  ),
                  const SizedBox(height: 10,),
                  const CommonTextField(
                    placeHolder: "Email",
                  ),
                  const SizedBox(height: 10,),
                  const CommonTextField(
                    placeHolder: "Phone",
                  ),
                  const SizedBox(height: 10,),
                  const CommonTextField(
                    placeHolder: "Date of birth",
                  ),
                  const SizedBox(height: 10,),
                  const CommonTextField(
                    placeHolder: "Password",
                  ),
                  const SizedBox(height: 40,),
                  const FlexButton(
                    text: "SIGN UP",
                  ),
                  const SizedBox(height: 53,),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Center(
                    child: Text(
                      "By clicking Sign up you agree to the following\nTerms and Conditions without reservation",
                      style: AppStylesText.caption13.regular.copyWith(color: AppColor.unselectItems),
                      textAlign: TextAlign.center,
                    ),
                  ),
            )
        ]),
      ),
    );
  }
}