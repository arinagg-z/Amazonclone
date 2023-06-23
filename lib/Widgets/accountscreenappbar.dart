import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class accounscreenappbar extends StatelessWidget with PreferredSizeWidget {
  accounscreenappbar({Key? key})
      : preferredSize = Size.fromHeight(kAppBarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              amazonLogoUrl,
              height: kAppBarHeight * 0.7,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.notifications_none)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ],
          )
        ],
      ),
    );
  }
}
