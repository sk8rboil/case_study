// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/signin_controller.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put((SigninController()));
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailC,
                      decoration: InputDecoration(
                        labelText: 'email',
                      ),
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
                    TextFormField(
                        controller: controller.passwordC,
                        decoration: InputDecoration(
                          labelText: 'password',
                        ),
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
              ElevatedButton(
                onPressed: () {
                  controller.signinwithEmail(context);
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('LOGIN'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/register_screen');
                },
                child: Text('REGISTER'),
              ),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed('/newpass_screen');
                },
                child: Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
