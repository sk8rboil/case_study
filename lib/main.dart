// ignore_for_file: prefer_const_constructors, prefer_void_to_null

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_presence_app/homepage.dart';
import 'package:my_presence_app/screens/login_screen.dart';
import 'package:my_presence_app/screens/newpass_screen.dart';
import 'package:my_presence_app/screens/profile_screen.dart';
import 'package:my_presence_app/screens/resetpass_screen.dart';
import 'package:my_presence_app/screens/register_screen.dart';
import 'package:my_presence_app/screens/update_profile_screen.dart';

String initialroute = "/login_screen";
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        //login
        initialroute = '/homepage';
      }
      runApp(const MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: initialroute,
      getPages: [
        GetPage(name: '/homepage', page: () => MyHomePage()),
        GetPage(name: '/register_screen', page: () => RegisterScreen()),
        GetPage(name: '/login_screen', page: () => MyLoginScreen()),
        GetPage(name: '/resetpass_screen', page: () => MyResetPasswordScreen()),
        GetPage(name: '/newpass_screen', page: () => MyNewPasswordScreen()),
        GetPage(name: '/profile_screen', page: () => MyProfileScreen()),
        GetPage(
            name: '/updateprofile_screen', page: () => MyUpdateProfileScreen()),
      ],
    );
  }
}
