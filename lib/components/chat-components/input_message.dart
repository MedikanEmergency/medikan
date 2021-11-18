import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputMessage extends StatelessWidget {
  FirebaseFirestore firestore = Get.find<FirebaseFirestore>();
  FirebaseAuth auth = Get.find<FirebaseAuth>();
  AuthInfo userState = Get.find<AuthInfo>();
  var height, width;
  final fractor = 0.06;
  final link;
  TextEditingController messageController = TextEditingController();

  InputMessage({required this.link});

  void initSize(BuildContext ctx) {
    height = MediaQuery.of(ctx).size.height * fractor;
    width = MediaQuery.of(ctx).size.width;
  }

  void _sendMessage() {
    if (messageController.text.isEmpty) return;
    var time = Timestamp.now();
    firestore.collection(link).add({
      'text': messageController.text.trim(),
      'time': time,
      'is_doctor': userState.getDoctor(),
    });
    if (!userState.getDoctor()) {
      firestore.collection('conversations').doc('${auth.currentUser!.uid}').set(
        {
          'latest_message_time': time,
          'latest_message': messageController.text.trim(),
        },
        SetOptions(merge: true),
      );
    }
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    initSize(context);
    return Container(
      height: height,
      // padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        border: Border.all(color: ColorData.onPrimary),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  hintText: "Aa",
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red.withOpacity(0),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(onPressed: _sendMessage, icon: Icon(MyFlutterApp.send))
          ],
        ),
      ),
    );
  }
}
