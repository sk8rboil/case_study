// ignore_for_file: avoid_print, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController currentpassC = TextEditingController();
  TextEditingController newpassC = TextEditingController();
  TextEditingController confirmpassC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePass(context) async {
    if (currentpassC.text.isNotEmpty &&
        newpassC.text.isNotEmpty &&
        confirmpassC.text.isNotEmpty) {
      if (newpassC.text == confirmpassC.text) {
        try {
          String userEmail = auth.currentUser!.email!;
          await auth.signInWithEmailAndPassword(
              email: userEmail, password: currentpassC.text);
          await auth.currentUser!.updatePassword(newpassC.text);
        } on FirebaseAuthException catch (e) {
          if (e.code == "wrong-password") {
            showDialog(
                context: context,
                // ignore: prefer_const_constructors
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('WRONG PASSWORD'),
                      content: const Text('password not same pls check'),
                    ));
          } else {
            showDialog(
                context: context,
                // ignore: prefer_const_constructors
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('ERROR'),
                      content: Text(e.code.toLowerCase()),
                    ));
          }
        } catch (e) {
          showDialog(
              context: context,
              // ignore: prefer_const_constructors
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('ERROR'),
                    content: const Text('catch error'),
                  ));
        }
      } else {
        showDialog(
            context: context,
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('ERROR'),
                  content: const Text('ERROR'),
                ));
      }
    }
  }
}
