import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/chat-components/confirm_chat_button.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/screens/chat%20screen/chatting_screen.dart';
import 'package:medikan/themes/theme_data.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseFirestore _firestore = Get.find<FirebaseFirestore>();

  final FirebaseAuth _auth = Get.find<FirebaseAuth>();
  final AuthInfo _userState = Get.find<AuthInfo>();
  var chatTime;
  void startChat(context) {
    if (chatTime > 0) {
      chatTime--;
      _userState.setChatTime(chatTime);
      setState(() {});
      _firestore
          .collection('conversations')
          .doc('${_auth.currentUser!.uid}')
          .set({
        'chat_time': chatTime,
        'modified_time': Timestamp.now(),
      }, SetOptions(merge: true));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ChattingScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    chatTime = _userState.getChatTime();
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorData.secondary,
            gradient: RadialGradient(
              colors: [
                ColorData.secondary.withOpacity(0.1),
                ColorData.secondary,
              ],
              center: Alignment.center,
            ),
          ),
          width: screen_width * 0.9,
          height: screen_width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screen_width * 0.075),
                child: Text(
                  "Số lần nhắn tin còn lại trong ngày",
                  style: FontStyleData.H2_bold_30,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen_width * 0.1),
                child: Text(
                  "$chatTime",
                  style: TextStyle(
                      color: ColorData.primary,
                      fontSize: 75,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screen_width * 0.06),
                child: ConfirmChatButton(
                  callback: () => startChat(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
