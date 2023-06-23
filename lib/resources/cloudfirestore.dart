import 'package:amazonclone/model/user_detail_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class cloudfirestore {
  FirebaseFirestore cloud = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future uploadnameandaddress(
      {required userdetailmodel user}) async {
    await cloud.collection("Users").doc(auth.currentUser!.uid).set(user.getjson());
  }
}
