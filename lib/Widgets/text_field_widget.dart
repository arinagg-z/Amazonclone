import 'package:flutter/material.dart';

class textz extends StatefulWidget {
  final TextEditingController controller;
  final bool obsuretext;
  final String title;

  const textz(
      {super.key,
      required this.controller,
      required this.obsuretext,
      required this.title});

  @override
  State<textz> createState() => _textzState();
}

class _textzState extends State<textz> {
  late FocusNode focusNode;
  bool isfocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isfocus = true;
        });
      } else {
        setState(() {
          isfocus = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isfocus
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2)
                : BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2),
          ]),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.obsuretext,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.orange),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
