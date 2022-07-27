// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/newpass_controller.dart';

class MyNewPasswordScreen extends StatelessWidget {
  const MyNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put((NewPassController()));
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: controller.newpassC,
                        decoration: InputDecoration(
                          labelText: 'password',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณากรอกรหัสผ่าน';
                          } else if (value.isNotEmpty && value.length < 8) {
                            return 'กรุณากรอกรหัสผ่านอย่างน้อย 8 ตัวอักษร';
                          } else {
                            return null;
                          }
                        }),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.newpassword(context);
                }
              },
              child: Text('CONFIRM'),
            ),
          ],
        ),
      ),
    );
  }
}
