import 'package:amazonclone/Widgets/cartitemwidget.dart';
import 'package:amazonclone/Widgets/custom_main_button.dart';
import 'package:amazonclone/Widgets/userdetailsbar.dart';
import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

import '../Widgets/searchbarwidget.dart';
import '../model/user_detail_model.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreen();
}

class _cartscreen extends State<cartscreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    return Scaffold(
      appBar: searchbarwidget(
        isreadonly: true,
        hasbackbutton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: kAppBarHeight / 2 + 20,
                  ),
                  custommainbutton(
                      color: yellowColor,
                      onPressed: () {},
                      isloading: false,
                      child: Text("Products Item")),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Center(
                                child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: cartitemwidget(),
                            ));
                          }))
                  // categoryhorizontallistview(),
                  // bannerads(),
                  // textlistview(),
                  // textlistview(),
                  // textlistview(),
                ],
              ),
            ),
          ),
          userdetailsbar(
              offset: offset, user: userdetailmodel("Arin", "Flying")),
        ],
      ),
    );
  }
}
