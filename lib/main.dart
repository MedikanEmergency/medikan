import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  try {
    await Firebase.initializeApp();
    print("\n\n\nsuccess\n\n\n");
  } catch (e) {
    print("\n\n\nfailed\n\n\n");
  }
  Get.put(FirebaseAuth.instance);
  Get.put(FirebaseFirestore.instance);
  runApp(Medikan());
}

class Medikan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
