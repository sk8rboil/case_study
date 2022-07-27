// ignore_for_file: avoid_print, unnecessary_string_interpolations, prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddPageController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createAccount(context) async {
    if (usernameC.text.isNotEmpty &&
        passwordC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      try {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );
        if (credential.user != null) {
          String uid = credential.user!.uid;
          firestore.collection("users").doc(uid).set({
            "uid": uid,
            "username": usernameC.text,
            "password": passwordC.text,
            "email": emailC.text,
            "createAt": DateTime.now().toIso8601String(),
          });
          credential.user!.sendEmailVerification();
        } else {}
      } on FirebaseAuthException catch (e) {
        /* if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('WEAK PASSWORD'),
                    content: const Text('password at least 6 character'),
                  ));
        } else */
        if (e.code == 'email-already-in-use') {
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
