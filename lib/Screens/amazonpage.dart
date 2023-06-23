import 'package:amazonclone/Screens/sign_up_screen.dart';
import 'package:amazonclone/Widgets/custom_main_button.dart';
import 'package:amazonclone/Widgets/text_field_widget.dart';
import 'package:amazonclone/utlis/constants.dart';
import 'package:amazonclone/utlis/utils.dart';
import 'package:flutter/material.dart';

import '../resources/authentication_resources.dart';

class amazonpage extends StatefulWidget {
  const amazonpage({super.key});

  @override
  State<amazonpage> createState() => _amazonpageState();
}

class _amazonpageState extends State<amazonpage> {
  TextEditingController econtroller = new TextEditingController();
  TextEditingController pcontroller = new TextEditingController();
  Size size = Utils().getScreenSize();
  AuthenticationMethods auth = new AuthenticationMethods();
  bool isloading = false;

  @override
  void dispose() {
    super.dispose();
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
                  Container(
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
                            "Sign In",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.w700),
                          ),
                          textz(
                              controller: econtroller,
                              obsuretext: false,
                              title: "Email"),
                          textz(
                              controller: pcontroller,
                              obsuretext: true,
                              title: "Password"),
                          Align(
                            alignment: Alignment.center,
                            child: custommainbutton(
                                color: Colors.orange,
                                onPressed: () async {
                                  setState(() {
                                    isloading = true;
                                  });
                                  String output = await auth.signinuser(
                                      email: econtroller.text,
                                      password: pcontroller.text);
                                  if (output == "Sucess") {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                        setState(() {
                                          isloading=false;
                                        });
                                  } else {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                                isloading: isloading,
                                child: Text(
                                  "Sign-In",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    )),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 2,
                        color: Colors.grey,
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "New to Amazon?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        height: 2,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                  custommainbutton(
                      color: Colors.grey[400]!,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      isloading: false,
                      child: Text(
                        " Create a new Account ",
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
