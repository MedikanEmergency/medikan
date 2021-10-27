import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medikan/components/chat-components/client_message_bubble.dart';
import 'package:medikan/components/chat-components/input_message.dart';
import 'package:medikan/components/chat-components/my_message_bubble.dart';
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

  @override
  void initState() {
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  final streak = [
    "Hello",
    "how r u",
    "im good",
    "fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
  ];
  void addMessage() {
    streak.add("Hello mother fucker");
    _scrollToBottom();
    setState(() {});
  }

  final _instance = FirebaseFirestore.instance
      .collection('chats/vTMIJlJKQ2CbGcHw55LA/messages');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addMessage();
        },
      ),
      appBar: AppBar(
        title: Text(
          "Chatting",
          style: FontStyleData.H1_bold_36,
        ),
        iconTheme: IconThemeData(color: ColorData.onPrimary),
        backgroundColor: ColorData.secondary,
      ),
      body: Center(
        child: ListView(
          controller: _scrollController,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClientMessageBubble(
                  messageStreak: [
                    "Hello",
                    "how r u",
                    "im good",
                    "fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyBubbleMessage(messageStreak: streak),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
      // body: StreamBuilder(
      //   builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
      //     if (streamSnapShot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: Text("Hello"),
      //       );
      //     }
      //     final documents = streamSnapShot.data?.docs;
      //     return ListView.builder(
      //       itemBuilder: (ctx, item) {
      //         return Text("${documents?[item]['text']}");
      //       },
      //       itemCount: documents?.length,
      //     );
      //   },
      //   stream: _instance.orderBy("text", descending: false).snapshots(),
      // ),
    );
  }
}
