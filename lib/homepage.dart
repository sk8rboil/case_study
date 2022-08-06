// ignore_for_file: prefer_const_constructors, prefer_void_to_null, avoid_print, unused_local_variable, avoid_unnecessary_containers, non_constant_identifier_names, unnecessary_string_interpolations, prefer_if_null_operators
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_presence_app/controllers/home_controller.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put((HomeController()));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('DATA'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/profile_screen');
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;

              return ListView(
                padding: EdgeInsets.all(8.0),
                children: <Widget>[
                  user_detail(user),
                  card1(user),
                  card2(),
                  Divider(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'LAST 5 DAYS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('see more'),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade300,
                          ),
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  Text(
                                    'DATA1',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                  '${DateFormat.jms().format(DateTime.now())}'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  Text(
                                    'DATA2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                  '${DateFormat.jms().format(DateTime.now())}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('NO DATA'),
              );
            }
          },
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,

          // ignore: prefer_const_literals_to_create_immutables
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.people, title: 'Add'),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: (int i) => print('click index=$i'),
        ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Padding user_detail(user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              height: 75,
              width: 75,
              color: Colors.grey.shade300,
              child: Center(
                child: Text('data'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text('WELCOME'),
              Text(user["username"]),
            ],
          ),
        ],
      ),
    );
  }

  card2() => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
          ),
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('data'),
                  Text('-'),
                ],
              ),
              VerticalDivider(
                width: 10,
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('data'),
                  Text('-'),
                ],
              ),
            ],
          ),
        ),
      );

  card1(user) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
          ),
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Text('data',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              Divider(
                height: 10,
              ),
              Text(user["email"],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              Text('data'),
            ],
          ),
        ),
      );
}

Future<Null> signOut() async {
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.signOut().then((value) {
      print('signout success');
      Get.offAllNamed('/login_screen');
    });
  });
}
