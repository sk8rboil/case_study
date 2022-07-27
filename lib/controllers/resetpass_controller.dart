import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void sendEmail(context) async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);
        showDialog(
            context: context,
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('SEND RESET PASSWORD TO EMAIL'),
                  content: const Text('please check your email'),
                ));
        Get.back();
      } catch (e) {
        isLoading.value = false;
        showDialog(
            context: context,
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('NO EMAIL'),
                  content: const Text('please check your email'),
                ));
      } finally {
        isLoading.value = false;
      }
    }
  }
}
