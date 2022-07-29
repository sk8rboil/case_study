// ignore_for_file: prefer_const_constructors, prefer_void_to_null, avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/home_controller.dart';
import 'package:my_presence_app/controllers/signout_controller.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((SignoutController()));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DATA'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/profile_screen');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Text('WELCOME TO HOMEPAGE'),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<Null> signOut() async {
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.signOut().then((value) {
      print('signout success');
      Get.offAllNamed('/login_screen');
    });
  });
}
