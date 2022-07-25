// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/createaccount_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put((AddPageController()));
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: controller.usernameC,
                              decoration: InputDecoration(
                                labelText: 'username',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกชื่อผู้ใช้งาน';
                                } else {
                                  return null;
                                }
                              }),
                          TextFormField(
                              controller: controller.passwordC,
                              decoration: InputDecoration(
                                labelText: 'password',
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกรหัสผ่าน';
                                } else if (value.isNotEmpty &&
                                    value.length < 8) {
                                  return 'กรุณากรอกรหัสผ่านอย่างน้อย 8 ตัวอักษร';
                                } else {
                                  return null;
                                }
                              }),
                          TextFormField(
                            controller: controller.emailC,
                            decoration: InputDecoration(
                              labelText: 'email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกอีเมล';
                              } else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'กรุณาตรวจสอบอีเมลอีกครั้ง';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  controller.createAccount(context);
                }
              },
              child: Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }
}
