import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medikan/screens/Onboarding/onboarding_screen.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   try {
//     await Firebase.initializeApp();
//     print("\n\n\nsuccess\n\n\n");
//   } catch (e) {
//     print("\n\n\nfailed\n\n\n");
//   }
//   Get.put(FirebaseAuth.instance);
//   Get.put(FirebaseFirestore.instance);
//   runApp(Medikan());
// }

Future<void> main() async {
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

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(Medikan());
}

// int? initScreen;
//  Future<void> main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    initScreen = await preferences.getInt('initScreen');
//    await preferences.setInt('initScreen', 1);

//  }

class Medikan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ? 'onBoard' : 'home',
      routes: {
        'home': (context) => LoginScreen(),
        'onBoard': (context) => OnBoarding(),
      },
    );
  }
}
