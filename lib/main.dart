import 'package:amazonclone/Screens/amazonpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: amazonpage(),
    );
  }
}

