import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignoutController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signout() async {
    await auth.signOut();
    Get.offAllNamed('/login_screen');
  }
}
