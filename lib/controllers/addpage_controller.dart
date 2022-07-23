// ignore_for_file: avoid_print, unnecessary_string_interpolations, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPageController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void addpage(context) async {
    print('test');
    if (usernameC.text.isNotEmpty &&
        passwordC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      try {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('weak-password'),
                  ));
        } else if (e.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('email-already-in-use'),
                  ));
        }
      } catch (e) {
        print(e);
      }
    } else {
      Get.snackbar('Login Success', '');
      print(emailC.text);
    }
  }
}
