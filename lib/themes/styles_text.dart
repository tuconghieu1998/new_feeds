import 'package:flutter/material.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get fontHeader {
    return copyWith(
      fontSize: 22,
      height: 22 / 20,
    );
  }

  TextStyle get fontCaption {
    return copyWith(
      fontSize: 12,
      height: 12 / 10,
    );
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w800);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

class AppStylesText {
  AppStylesText(this.context);

  BuildContext? context;

  static const TextStyle headLine1 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    height: 48/40,
  );

   static const TextStyle headLine2 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 28,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    height: 34/28,
  );

   static const TextStyle headLine3 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    height: 28/22,
  );

  static const TextStyle body20 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 25/12,
  );
   
  static const TextStyle body15 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 20/15,
  );

  static const TextStyle body17 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    height: 22/12,
  );

  static const TextStyle caption13 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 13,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 18/13,
  );

  static const TextStyle caption11 = TextStyle(
    fontFamily: "Avenir",
    fontSize: 11,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 13/11,
  );

  static const TextStyle tagline = TextStyle(
    fontFamily: "Avenir",
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    height: 20/15,
  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);