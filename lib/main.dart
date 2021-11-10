import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  runApp(Medikan());
}

class Medikan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
