import 'package:amazonclone/model/user_detail_model.dart';
import 'package:amazonclone/resources/cloudfirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore cloud = FirebaseFirestore.instance;
  Future<String> signupuser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();

    String output = "";

    if (name != '' && address != '' && email != '' && password != '') {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        userdetailmodel user = userdetailmodel(name, address);
        await cloudfirestore().uploadnameandaddress(user: user);
        output = 'sucess';
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = 'failure';
    }
    return output;
  }

  Future<String> signinuser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();

    String output = "";

    if (email != '' && password != '') {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        output = 'sucess';
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = 'failure';
    }
    return output;
  }
}
