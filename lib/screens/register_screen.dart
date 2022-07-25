// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/createaccount_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    TextFormField(
                      controller: controller.usernameC,
                      decoration: InputDecoration(
                        labelText: 'username',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    TextFormField(
                      controller: controller.passwordC,
                      decoration: InputDecoration(
                        labelText: 'password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    TextFormField(
                      controller: controller.emailC,
                      decoration: InputDecoration(
                        labelText: 'email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.createAccount(context);
              },
              child: Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }
}
