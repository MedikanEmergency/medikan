import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medikan/screens/Onboarding/onboarding_screen.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/auth_info.dart';

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
Future<void> getPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
    // Permission.contacts,
    Permission.mediaLibrary,
    Permission.phone,
    Permission.sms,
  ].request();

  var loc = await Permission.location.status;
  var store = await Permission.storage.status;
  var media = await Permission.mediaLibrary.status;
  var phone = await Permission.phone.status;
  var sms = await Permission.sms.status;

  if ((loc.isDenied || phone.isDenied || sms.isDenied)) {
    SystemNavigator.pop();
  }
}

Future<void> initInfo() async {
  var _userState = Get.put(AuthInfo());
  var _auth = Get.find<FirebaseAuth>();
  var _firestore = Get.find<FirebaseFirestore>();
  _userState.setPhone(_auth.currentUser!.phoneNumber.toString());
  await _firestore
      .collection('account')
      .doc('${_auth.currentUser!.uid}')
      .get()
      .then((value) {
    var temp = value.data()!['is_doctor'].toString();
    print(temp);
    _userState.setDoctor(temp == 'true');
    _userState.setImg(value.data()!['img']);
    _userState.setPassword(value.data()!['password']);
  });
  await _firestore
      .collection('conversations')
      .doc('${_auth.currentUser!.uid}')
      .get()
      .then((value) {
    var name = value.data()!['name'];
    print(name);
    _userState.setName(name);
  });
}

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
  await getPermissions();
  Get.put(FirebaseAuth.instance);
  Get.put(FirebaseFirestore.instance);
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  if (FirebaseAuth.instance.currentUser != null) {
    await initInfo();
  }

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
        'home': (context) => FirebaseAuth.instance.currentUser == null
            ? SafeArea(child: LoginScreen())
            : MainScreen(),
        'onBoard': (context) => SafeArea(child: OnBoarding()),
      },
    );
  }
}
