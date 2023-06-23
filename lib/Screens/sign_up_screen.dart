import 'dart:math';

import 'package:amazonclone/Screens/amazonpage.dart';
import 'package:amazonclone/Widgets/custom_main_button.dart';
import 'package:amazonclone/Widgets/text_field_widget.dart';
import 'package:amazonclone/resources/authentication_resources.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => signupstate();
}

class signupstate extends State<signup> {
  TextEditingController ncontroller = new TextEditingController();
  TextEditingController acontroller = new TextEditingController();
  TextEditingController econtroller = new TextEditingController();
  TextEditingController pcontroller = new TextEditingController();
  Size size = Utils().getScreenSize();
  AuthenticationMethods auth = new AuthenticationMethods();
  bool isloading = false;
  @override
  void dispose() {
    super.dispose();
    ncontroller.dispose();
    acontroller.dispose();
    econtroller.dispose();
    pcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Center(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: size.height * 0.10,
                  ),
                  SizedBox(
                    height: size.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 33, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              textz(
                                  controller: ncontroller,
                                  obsuretext: false,
                                  title: "Name"),
                              textz(
                                  controller: acontroller,
                                  obsuretext: false,
                                  title: "Address"),
                              textz(
                                  controller: econtroller,
                                  obsuretext: false,
                                  title: "Email"),
                              textz(
                                  controller: pcontroller,
                                  obsuretext: true,
                                  title: "Password"),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: custommainbutton(
                        color: Colors.orange,
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          String output = await auth.signupuser(
                              name: ncontroller.text,
                              address: acontroller.text,
                              email: econtroller.text,
                              password: pcontroller.text);
                          if (output == 'sucess') {
                            setState(() {
                              isloading = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => amazonpage()));
                          } else {
                            Utils().showSnackBar(
                                context: context, content: output);
                          }
                        },
                        isloading: isloading,
                        child: Text(
                          "Sign-Up",
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        )),
                  ),
                  custommainbutton(
                      color: Colors.grey[400]!,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isloading: false,
                      child: Text(
                        " Back ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
