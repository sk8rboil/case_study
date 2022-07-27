// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyNewPasswordScreen extends StatelessWidget {
  const MyNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'email',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'password',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'newpassword',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('CONFIRM'),
            ),
          ],
        ),
      ),
    );
  }
}
