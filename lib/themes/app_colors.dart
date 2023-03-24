import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xffF54B64);
  static const Color backgroundBottomNavigation = Color(0xff20242F);
  static const Color unselectItems = Color(0xff4E586E);
  static const Color divideColor = Color(0xff242A37);
  static const Color backgroundSearchBar = Color.fromRGBO(142, 142, 147, 0.12);

  
  static const Color blue = Color(0xff007AFF);
  static const Color orange = Color(0xffFF9500);
  static const Gradient pink = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffF78361),
      Color(0xffF54B64)
    ],
  );
  static const Color purple = Color(0xff5856D6);
  static const Color tealPurple = Color(0xff5AC8FA);
  static const Color yellow = Color(0xffFFCC00);
  static const Color burn = Color(0xff4D4D4D);

  static const Color gray1 = Color(0xff8E8E93);
  static const Color gray2 = Color(0xffC7C7CC);
  static const Color gray3 = Color(0xffD1D1D6);
  static const Color gray4 = Color(0xffE5E5EA);
  static const Color gray5 = Color(0xffEFEFF4);


  static const Color adding = Color(0xff4CD964);
  static const Color detructive = Color(0xffFF3B30);
  static const Color dark = Color(0xff1D1D26);
  static const Color light = Color(0xffFFFFFF);


  static const Color backgroundKeyBoardGray = Color.fromRGBO(210, 213, 219, 0.94);
  static const Color backgroundKeyBoardLightGray = Color.fromRGBO(239, 239, 244, 0.94);
  static const Color backgroundLightestGray = Color.fromRGBO(243, 243, 243, 1);
  static const Color backgroundBarsLightGray = Color.fromRGBO(248, 248, 248, 0.92);
  static const Color backgroundBarsLight = Color.fromRGBO(255, 255, 255, 0.92);
  static const Color backgroundWhite = Color.fromRGBO(255, 255, 255, 0.92);

  static const Color scrimsDarker60 = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color scrimsDarker30 = Color.fromRGBO(0, 0, 0, 0.3);
  static const Gradient scrimDarkerTop60 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.6),
      Color.fromRGBO(0, 0, 0, 0.01),
    ],
  );
  static const Gradient scrimDarkerTop30 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.3),
      Color.fromRGBO(0, 0, 0, 0.01),
    ],
  );
  static const Gradient scrimDarkerBottom80 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.01),
      Color.fromRGBO(0, 0, 0, 0.8),
    ],
  );
  static const Gradient scrimDarkerBottom60 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.01),
      Color.fromRGBO(0, 0, 0, 0.6),
    ],
  );
  static const Gradient scrimDarkerBottom30 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.01),
      Color.fromRGBO(0, 0, 0, 0.3),
    ],
  );
}