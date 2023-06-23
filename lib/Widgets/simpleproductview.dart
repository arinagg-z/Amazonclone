import 'package:flutter/material.dart';

class simpleproductview extends StatelessWidget {
  final String url;

  const simpleproductview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Image.network(url),
      ),
    );
  }
}
