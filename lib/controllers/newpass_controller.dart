import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPassController extends GetxController {
  TextEditingController newpassC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void newpassword(context) async {
    if (newpassC.text.isNotEmpty) {
      if (newpassC.text != "password") {
        await auth.currentUser!.updatePassword(newpassC.text);
        String email = auth.currentUser!.email!;
        await auth.signOut();
        await auth.signInWithEmailAndPassword(
            email: email, password: newpassC.text);
        Get.offAllNamed('/login_screen');
      } else {
        showDialog(
            context: context,
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('password1'),
                  content: const Text('password1'),
                ));
      }
    }
  }
}
