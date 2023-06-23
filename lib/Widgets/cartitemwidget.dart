import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class cartitemwidget extends StatelessWidget {
  const cartitemwidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    return Container(
      height: size.height / 4,
      width: size.width * 0.8,
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Row(
                children: [
                  Image.network(
                    amazonLogoUrl,
                    scale: 0.8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Elegant Black Shoes",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "\$",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: "750",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "sold by ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: "Rick Avley",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: activeCyanColor),
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [],
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [],
              )),
        ],
      ),
    );
  }
}
