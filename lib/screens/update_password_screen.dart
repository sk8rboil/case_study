// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyUpdatePasswordScreen extends StatelessWidget {
  const MyUpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(
                      labelText: 'current password',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'new password',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'confirm password',
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
    );
  }
}
