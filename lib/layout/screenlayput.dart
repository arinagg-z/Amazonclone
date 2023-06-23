import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:flutter/material.dart';

class screenlayout extends StatefulWidget {
  const screenlayout({super.key});

  @override
  State<screenlayout> createState() => _screenlayoutState();
}

class _screenlayoutState extends State<screenlayout> {
  PageController pageController = PageController();
  int currentPage = 0;
  changepage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
          )),
          child: TabBar(
              onTap: changepage,
              indicator: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                width: 4,
                color: activeCyanColor,
              ))),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.home_outlined,
                    color: currentPage == 0 ? activeCyanColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.account_balance_outlined,
                    color: currentPage == 1 ? activeCyanColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: currentPage == 2 ? activeCyanColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.menu,
                    color: currentPage == 3 ? activeCyanColor : Colors.black,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
