import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/chat-components/client_message_bubble.dart';
import 'package:medikan/components/chat-components/input_message.dart';
import 'package:medikan/components/chat-components/message_list.dart';
import 'package:medikan/components/chat-components/my_message_bubble.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/models/msg_streak.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore';

class ChattingScreen extends StatefulWidget {
  var idMess = null;
  var name = null;
  ChattingScreen({this.idMess, this.name});
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
  FirebaseAuth firebaseAuth = Get.find<FirebaseAuth>();
  FirebaseFirestore firestore = Get.find<FirebaseFirestore>();
  AuthInfo state = Get.find<AuthInfo>();

  // var appBar = AppBar(
  //   title: Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(right: 5),
  //         child: CircleAvatar(
  //           backgroundImage: AssetImage("assets/images/psycho_op.jpg"),
  //         ),
  //       ),
  //       Text(
  //         widget.name == null ? "Bác sĩ" : widget.name,
  //         style: FontStyleData.Title_Bold_20,
  //       )
  //     ],
  //   ),
  //   iconTheme: IconThemeData(color: ColorData.onPrimary),
  //   backgroundColor: ColorData.secondary,
  // );

  @override
  Widget build(BuildContext context) {
    final id =
        widget.idMess == null ? firebaseAuth.currentUser!.uid : widget.idMess;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                backgroundImage: state.getDoctor()
                    ? AssetImage("assets/images/patient.png")
                    : AssetImage("assets/images/doctor.png"),
              ),
            ),
            Text(
              widget.name == null ? "Bác sĩ" : widget.name,
              style: FontStyleData.Title_Bold_20,
            )
          ],
        ),
        iconTheme: IconThemeData(color: ColorData.onPrimary),
        backgroundColor: ColorData.secondary,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: MessageList(
                link: 'conversations/${id}/messages',
              ),
            ),
            InputMessage(
              link: 'conversations/${id}/messages',
            ),
          ],
        ),
      ),
    );
  }
}
