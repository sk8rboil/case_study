import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateProfile(String uid, context) async {
    if (usernameC.text.isNotEmpty && emailC.text.isNotEmpty) {
      try {
        await firestore.collection("users").doc(uid).update({
          "username": usernameC.text,
          "email": emailC.text,
        });
      } catch (e) {
        showDialog(
            context: context,
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('ERROR'),
                  content: const Text('error'),
                ));
      }
    }
  }
}
