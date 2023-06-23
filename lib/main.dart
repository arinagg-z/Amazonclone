import 'package:amazonclone/Screens/amazonpage.dart';
import 'package:amazonclone/layout/screenlayput.dart';
import 'package:amazonclone/utlis/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDOP4i9mEQGqO8rcXRQaDGFfVKlAqYiSZc",
            authDomain: "clone-11969.firebaseapp.com",
            projectId: "clone-11969",
            storageBucket: "clone-11969.appspot.com",
            messagingSenderId: "55183942537",
            appId: "1:55183942537:web:f716707bc5d73e84f97758"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              return screenlayout();
            } else {
              return const amazonpage();
            }
          }),
    );
  }
}
