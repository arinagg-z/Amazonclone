import 'package:amazonclone/model/user_detail_model.dart';
import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class userdetailsbar extends StatelessWidget {
  final double offset;
  final userdetailmodel user;

  const userdetailsbar({super.key, required this.offset, required this.user});

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();

    return Positioned(
      top: -offset / 5,
      child: Container(
        height: kAppBarHeight / 2,
        width: size.width,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: lightBackgroundaGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(
              width: 20,
            ),
            Text(
              " Deliver to ${user.name} - ${user.address}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
