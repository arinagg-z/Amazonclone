import 'package:amazonclone/Widgets/accountscreenappbar.dart';
import 'package:amazonclone/Widgets/custom_main_button.dart';
import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

import '../Widgets/productlistview.dart';
import '../Widgets/simpleproductview.dart';

class accountscreen extends StatefulWidget {
  const accountscreen({super.key});

  @override
  State<accountscreen> createState() => _accountscreenState();
}

class _accountscreenState extends State<accountscreen> {
  Size size = Utils().getScreenSize();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: accounscreenappbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              introbaraccountscreen(size: size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: custommainbutton(
                    color: Colors.orange,
                    onPressed: () {},
                    isloading: false,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: custommainbutton(
                    color: yellowColor,
                    onPressed: () {},
                    isloading: false,
                    child: Text(
                      "Sell",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ),
              accountscrreenlistview(),
              Text(
                "Orders",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          title: Text(
                            "Black Shoes",
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            "\$100",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class accountscrreenlistview extends StatelessWidget {
  const accountscrreenlistview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return productlistview(title: "Orders", children: [
      simpleproductview(url: categoryLogos[0]),
      simpleproductview(url: categoryLogos[1]),
      simpleproductview(url: categoryLogos[2]),
      simpleproductview(url: categoryLogos[3]),
      simpleproductview(url: categoryLogos[4]),
      simpleproductview(url: categoryLogos[5]),
      simpleproductview(url: categoryLogos[5]),
      simpleproductview(url: categoryLogos[5]),
      simpleproductview(url: categoryLogos[5]),
      simpleproductview(url: categoryLogos[5]),
      simpleproductview(url: categoryLogos[5]),
      simpleproductview(url: categoryLogos[5]),
    ]);
  }
}

class introbaraccountscreen extends StatelessWidget {
  const introbaraccountscreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: kAppBarHeight / 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Container(
        width: size.width,
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white.withOpacity(0.0000000000000001)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: " Hello , "),
              TextSpan(text: " Arin "),
            ])),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(smallAds[1]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
