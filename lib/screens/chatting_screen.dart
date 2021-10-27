import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore';

class ChattingScreen extends StatefulWidget {
  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
    } catch (e) {
      print("error");
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  String temp = "test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chatting",
            style: FontStyleData.H1_bold_36,
          ),
          iconTheme: IconThemeData(color: ColorData.onPrimary),
          backgroundColor: ColorData.secondary,
        ),
        body: ListView(
          children: [
            Text(temp),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('chats/vTMIJlJKQ2CbGcHw55LA/messages')
                      .snapshots()
                      .listen((event) {
                    temp = event.docs[0]['text'];
                    setState(() {});
                  });
                },
                child: Text("Testing"))
          ],
        ));
  }
}
