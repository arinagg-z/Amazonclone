import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class bannerads extends StatefulWidget {
  const bannerads({super.key});

  @override
  State<bannerads> createState() => _banneradsState();
}

class _banneradsState extends State<bannerads> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    double smalladheight = size.height / 5;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentpage == largeAds.length - 1) {
          currentpage = -1;
        }
        setState(() {
          currentpage++;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 36 / 9,
                child: Image.network(
                  largeAds[currentpage],
                  height: size.height / 2.8,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    backgroundColor,
                    backgroundColor.withOpacity(0)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                ),
              )
            ],
          ),
          FittedBox(
            child: Container(
              color: backgroundColor,
              width: size.width,
              height: smalladheight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    smallads(0, smalladheight),
                    smallads(1, smalladheight),
                    smallads(2, smalladheight),
                    smallads(3, smalladheight),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

Widget smallads(int index, double height) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 7,
      horizontal: 15,
    ),
    child: Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Image.network(smallAds[index]),
            SizedBox(
              height: 5,
            ),
            Text(adItemNames[index]),
          ],
        ),
      ),
    ),
  );
}
