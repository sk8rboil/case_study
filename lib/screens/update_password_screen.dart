// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/update_pass_controller.dart';

class MyUpdatePasswordScreen extends StatelessWidget {
  const MyUpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((UpdatePasswordController()));
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE PASSWORD'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: controller.currentpassC,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'current password',
                    ),
                  ),
                  TextFormField(
                    controller: controller.newpassC,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'new password',
                    ),
                  ),
                  TextFormField(
                    controller: controller.confirmpassC,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'confirm password',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updatePass(context);
            },
            child: Text('CONFIRM'),
          ),
        ],
      ),
    );
  }
}
