import 'package:flutter/material.dart';
import 'package:news_feed/themes/app_colors.dart';
import 'package:news_feed/themes/styles_text.dart';
import 'package:news_feed/utils/asset_utils.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        decoration: BoxDecoration(
          color: AppColor.backgroundSearchBar,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15,),
            GestureDetector(
              child: const ImageIcon(AssetImage(AssetUtils.icoSearch),
                  size: 24, color: Colors.white),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 7, right: 20),
                    hintText: 'Search',
                    hintStyle: AppStylesText.body15
                        .copyWith(color: AppColor.unselectItems),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    focusColor: Colors.black
                ),
                style: AppStylesText.body15,
              ),
            )
          ],
        ));
  }
}
