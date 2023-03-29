import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/flex_button.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'package:news_feed/utils/image_utils.dart';

class LoginOrSignUpPage extends StatefulWidget {
  const LoginOrSignUpPage({super.key});

  static const String routeName = "/login_or_sign_up";

  @override
  State<LoginOrSignUpPage> createState() => _LoginOrSignUpPageState();
}

class _LoginOrSignUpPageState extends State<LoginOrSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        ImageUtils.loadFromAsset(AssetUtils.backgroundImage1,
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(gradient: AppColor.scrimDarkerBottom80),
        )),
        Positioned(
          top: MediaQuery.of(context).size.height / 3,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Find new\nfriends nearby",
                  style: AppStylesText.headLine1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(children: [
                    Text(
                      "With milions of users all over the world, we gives you the ability to connect with people no matter where you are.",
                      style: AppStylesText.body15.regular.copyWith(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    FlexButton(
                      text: "Log In",
                      isWhiteTheme: true,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FlexButton(
                      text: "Sign Up",
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              "Or log in with",
              style: AppStylesText.caption13
                  .copyWith(color: AppColor.unselectItems),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                    child: Center(
                        child: ImageIcon(
                      AssetImage(AssetUtils.icoFacebookWhite),
                      color: Colors.white,
                    )),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                GestureDetector(
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                    child: Center(
                        child: ImageIcon(
                      AssetImage(AssetUtils.icoTwitterWhite),
                      color: Colors.white,
                    )),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                GestureDetector(
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                    child: Center(
                        child: ImageIcon(
                      AssetImage(AssetUtils.icoGoogleWhite),
                      color: Colors.white,
                    )),
                  ),
                ),
              ],
            )
          ]),
        )
      ])),
    );
  }
}
