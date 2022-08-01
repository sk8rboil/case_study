// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, sized_box_for_whitespace

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
              String defaultImage =
                  "https://ui-avatars.com/api/?name=${user['username']}";
              return ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment(2, 1.2),
                          children: [
                            ClipOval(
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  user["profile"] != null
                                      ? user["profile"] != ""
                                          ? user["profile"]
                                          : 'https://ui-avatars.com/api/?name={$user["username"]}'
                                      : 'https://ui-avatars.com/api/?name={$user["username"]}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              onPressed: () {},
                              child: Icon(Icons.add),
                            ),
                          ],
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
                    onTap: () {
                      Get.toNamed(
                        '/updateprofile_screen',
                        arguments: user,
                      );
                    },
                    leading: Icon(Icons.person),
                    title: Text('Update Profile'),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('/updatepass_screen');
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
