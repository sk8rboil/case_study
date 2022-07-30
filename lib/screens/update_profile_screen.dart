// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/update_profile_controller.dart';

class MyUpdateProfileScreen extends StatelessWidget {
  const MyUpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user = Get.arguments;
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put((UpdateProfileController()));
    print(user);
    controller.usernameC.text = user["username"];
    controller.emailC.text = user["email"];
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE PROFILE'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: controller.usernameC,
                    decoration: InputDecoration(),
                  ),
                  TextFormField(
                    controller: controller.emailC,
                    decoration: InputDecoration(),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateProfile(user['uid'], context);
            },
            child: Text('UPDATE PROFILE'),
          ),
        ],
      ),
    );
  }
}
