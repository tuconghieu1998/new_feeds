import 'package:flutter/material.dart';

import '../../../common/widgets/stateless/common_text_field.dart';
import '../../../common/widgets/stateless/flex_button.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/styles_text.dart';
import '../../../utils/asset_utils.dart';
import '../../../utils/image_utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String routeName = '/forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ImageUtils.loadFromAsset(AssetUtils.backgroundImage3,
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
                child: Center(child: ImageIcon(AssetImage(AssetUtils.icoClose), color: Colors.white, size: 28,)),
              ),
            )
            ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
          left: 0,
          right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password",
                    style: AppStylesText.headLine1.copyWith(fontSize: 34),
                  ),
                  const SizedBox(height: 17,),
                  Text(
                    "Please enter your email address. You will receive a link to create a new password via email.",
                    style: AppStylesText.body15.regular.copyWith(fontSize: 17),
                  ),
                  const SizedBox(height: 40,),
                  const CommonTextField(
                    placeHolder: "Your email",
                  ),
                  const SizedBox(height: 40,),
                  const FlexButton(
                    text: "SEND",
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}