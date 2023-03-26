import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/utils/asset_utils.dart';

class IconCheckBox extends StatelessWidget {
  const IconCheckBox({super.key, this.checked});

  final bool? checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const RadialGradient(
            center: Alignment.bottomLeft,
            radius: 0.5,
            colors: <Color>[Color(0xffF78361), Color(0xffF54B64)],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: ImageIcon(
          AssetImage(checked == true ? AssetUtils.icoCheckBoxChecked : AssetUtils.icoCheckBoxPlus),
          color: Colors.white,
        ),
      ),
    );
  }
}
