import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class custommainbutton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final bool isloading;
  final Widget child;

  const custommainbutton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.isloading,
      required this.child});
  @override
  Widget build(BuildContext context) {
    Size size = Utils().getScreenSize();
    return ElevatedButton(
      onPressed: onPressed,
      child: isloading
          ? Padding(
              padding: EdgeInsets.all(5),
              child: AspectRatio(
                  aspectRatio: 1 / 1, child: CircularProgressIndicator()),
            )
          : child,
      style: ElevatedButton.styleFrom(
          backgroundColor: color, fixedSize: Size(size.width * 0.5, 40)),
    );
  }
}
