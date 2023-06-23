import 'package:amazonclone/Widgets/searchbarwidget.dart';
import 'package:flutter/material.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchbarwidget(isreadonly: false, hasbackbutton: true),
      body: Container(),
    );
  }
}
