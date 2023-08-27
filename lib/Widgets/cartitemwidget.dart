import 'package:amazonclone/Widgets/roundedbutton.dart';
import 'package:amazonclone/Widgets/simpledetailroundedbutton.dart';
import 'package:amazonclone/model/productmodel.dart';
import 'package:amazonclone/resources/cloudfirestore.dart';
import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class cartitemwidget extends StatelessWidget {
  final productmodel model;
  const cartitemwidget({super.key, required this.model});

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
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      model.url,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
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
                              text: model.price.toString(),
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
                              text: model.sellername,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: activeCyanColor),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 30,
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  roundedbutton(
                      dimensions: 60,
                      child: Icon(
                        Icons.remove,
                      )),
                  roundedbutton(dimensions: 60, child: Text("0")),
                  GestureDetector(
                      onTap: () async {
                        await cloudfirestore().addproducttocart(
                            model: model.copywith(uid: Utils().getUid()));
                      },
                      child: roundedbutton(
                          dimensions: 60, child: Icon(Icons.add))),
                ],
              )),
          SizedBox(
            height: 30,
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  simpledetailroundedbutton(
                      onpressed: () {}, text: "Delete", dimensions: 50),
                  SizedBox(
                    width: 30,
                  ),
                  simpledetailroundedbutton(
                      onpressed: () {},
                      text: "Save like this",
                      dimensions: 100),
                ],
              )),
        ],
      ),
    );
  }
}
