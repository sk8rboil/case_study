// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/resetpass_controller.dart';

class MyResetPasswordScreen extends StatelessWidget {
  const MyResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final controller = Get.put((ResetPasswordController()));
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    } else {
                      return null;
                    }
                  },
                  controller: controller.emailC,
                  decoration: InputDecoration(
                    labelText: 'email',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (controller.isLoading.isFalse) {
                    controller.sendEmail(context);
                  }
                }
              },
              child: Text('Reset Password'),
            )
          ],
        ),
      ),
    );
  }
}
