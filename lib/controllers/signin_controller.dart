// ignore_for_file: avoid_print, camel_case_types, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void signinwithEmail(context) async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

        if (credential.user != null) {
          print(credential);
          Get.offAllNamed('/homepage');
        } else {}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
              context: context,
              // ignore: prefer_const_constructors
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('USER NOT FOUND'),
                    content: const Text('no user'),
                  ));
        } else if (e.code == 'wrong-password') {
          showDialog(
              context: context,
              // ignore: prefer_const_constructors
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('WRONG PASSWORD'),
                    content: const Text('please check your password'),
                  ));
        }
      }
    } else {}
  }
}
