import 'package:amazonclone/Screens/ssearchscreen.dart';
import 'package:amazonclone/utlis/color_themes.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class searchbarwidget extends StatelessWidget with PreferredSizeWidget {
  final bool isreadonly;
  final bool hasbackbutton;
  searchbarwidget(
      {Key? key, required this.isreadonly, required this.hasbackbutton})
      : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(width: 1, color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Container()),
          hasbackbutton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios))
              : Container(),
          Expanded(flex: 3, child: Container()),
          SizedBox(
            width: size.width * 0.7,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, 10))
              ]),
              child: TextField(
                readOnly: isreadonly,
                onTap: () {
                  if (isreadonly) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => searchscreen()));
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search for anything in amazon",
                  fillColor: Colors.white,
                  filled: true,
                  border: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ),
          Expanded(flex: 2, child: Container()),
          IconButton(onPressed: () {}, icon: Icon(Icons.mic_none_outlined)),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
