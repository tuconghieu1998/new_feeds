import 'package:flutter/material.dart';
import 'package:news_feed/common/widgets/stateless/divide.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';
import 'dart:math' as math;

class SettingTile extends StatefulWidget {
  const SettingTile({super.key, this.title});

  final String? title;

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  double _angleButton = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                widget.title ?? "",
                style: AppStylesText.body17
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Transform.rotate(
                angle: _angleButton,
                child: ImageIcon(
                  AssetImage(AssetUtils.icoRight),
                  color: Colors.white,
                ),
              ),
              children: <Widget>[
                ListTile(title: Text('Coming soon', style: AppStylesText.body17.copyWith(fontSize: 15, fontWeight: FontWeight.w400)),),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _angleButton = (expanded ? 90 : 0) *math.pi / 180;
                });
              },
            ),
          ),
          const Divide(height: 1, color: Colors.black, opacity: 0.1,),
        ],
      ),
    );
  }
}
