import 'package:amazonclone/Widgets/bannerads.dart';
import 'package:amazonclone/Widgets/categoryhorizontallistview.dart';
import 'package:amazonclone/Widgets/productlistview.dart';
import 'package:amazonclone/Widgets/searchbarwidget.dart';
import 'package:amazonclone/Widgets/simpleproductview.dart';
import 'package:amazonclone/Widgets/userdetailsbar.dart';
import 'package:amazonclone/model/user_detail_model.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
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
    return Scaffold(
      appBar: searchbarwidget(
        isreadonly: true,
        hasbackbutton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                categoryhorizontallistview(),
                bannerads(),
                textlistview(),
                textlistview(),
                textlistview(),
              ],
            ),
          ),
          userdetailsbar(
              offset: offset, user: userdetailmodel("Arin", "Flying")),
        ],
      ),
    );
  }
}

class textlistview extends StatelessWidget {
  const textlistview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return productlistview(title: "Upto 70% Off", children: [
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
