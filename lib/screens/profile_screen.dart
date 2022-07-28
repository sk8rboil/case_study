// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/controllers/profile_controller.dart';
import 'package:my_presence_app/homepage.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((ProfileController()));
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamRole(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            /*  Object? user = snapshot.data!.data(); */
            if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;
              return ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              'https://ui-avatars.com/api/?name={$user["username"]}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: Text(
                    "${user['username'].toString().toUpperCase()}",
                    style: TextStyle(fontSize: 18),
                  )),
                  Center(
                      child: Text(
                    "${user['email'].toString().toUpperCase()}",
                    style: TextStyle(fontSize: 16),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.person),
                    title: Text('Update Profile'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/resetpass_screen');
                    },
                    leading: Icon(Icons.vpn_key),
                    title: Text('Update Password'),
                  ),
                  ListTile(
                    onTap: () {
                      signOut();
                    },
                    leading: Icon(Icons.logout_outlined),
                    title: Text('LOGOUT'),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('no user'),
              );
            }
          }),
    );
  }
}
