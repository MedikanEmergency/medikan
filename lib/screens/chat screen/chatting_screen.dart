import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medikan/components/chat-components/client_message_bubble.dart';
import 'package:medikan/components/chat-components/input_message.dart';
import 'package:medikan/components/chat-components/message_list.dart';
import 'package:medikan/components/chat-components/my_message_bubble.dart';
import 'package:medikan/models/msg_streak.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore';

class ChattingScreen extends StatefulWidget {
  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  // void initFirebase() async {
  //   try {
  //     await Firebase.initializeApp();
  //     print("success");
  //   } catch (e) {
  //     print("failed");
  //   }
  // }

  var inputMsg = InputMessage(
    link: 'chats/vTMIJlJKQ2CbGcHw55LA/messages',
  );
  var appBar = AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/psycho_op.jpg"),
          ),
        ),
        Text(
          "Bác sĩ",
          style: FontStyleData.Title_Bold_20,
        )
      ],
    ),
    iconTheme: IconThemeData(color: ColorData.onPrimary),
    backgroundColor: ColorData.secondary,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: MessageList(),
              ),
              InputMessage(link: 'chats/vTMIJlJKQ2CbGcHw55LA/messages')
            ],
          ),
        ));
  }
}
