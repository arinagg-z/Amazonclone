import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class productlistview extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const productlistview(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    double height = size.height / 4;
    double titleheight = 40;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      height: height,
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: titleheight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text("Show More",
                      style: TextStyle(
                        color: activeCyanColor,
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: height - titleheight - 16,
            width: size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
