// ignore_for_file: avoid_print, unnecessary_string_interpolations, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddPageController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void createAccount(context) async {
    /*  print(emailC.text);
    print(usernameC.text);
    print(passwordC.text);
    if (usernameC.text.isNotEmpty &&
        passwordC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      print('is not empty');
      try {
        Firebase.initializeApp().then((value) async {
          await auth
              .createUserWithEmailAndPassword(
                  email: emailC.text, password: passwordC.text)
              .then((value) {
            print('login success');
          });
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('weak-password'),
                  ));
        } else if (e.code == 'firebase_auth/email-already-in-use') {
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
      print('empty');
    } */
    if (usernameC.text.isNotEmpty &&
        passwordC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      try {
        final credential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('WEAK PASSWORD'),
                    content: const Text('password at least 6 character'),
                  ));
        } else if (e.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('EMAIL ALREADY IN USE'),
                    content: const Text(
                        'email is already in use please use another email'),
                  ));
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('WTH');
    }
  }
}
