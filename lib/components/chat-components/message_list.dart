import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medikan/models/msg_streak.dart';

import 'client_message_bubble.dart';
import 'my_message_bubble.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _instance = FirebaseFirestore.instance
        .collection('chats/vTMIJlJKQ2CbGcHw55LA/messages')
        .orderBy('time', descending: true);
    return StreamBuilder(
      stream: _instance.snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting)
          return Text("Waitting");
        var document = snapShot.data!.docs;
        if (document.length == 0) return Container();
        bool prev = document[0]['isDoctor'];
        List<MessageStreak> msgStreakList = [];
        MessageStreak msgStreak = MessageStreak(isDoctor: prev);
        for (var i in document) {
          if (i['isDoctor'] != prev) {
            msgStreak.msg = List.from(msgStreak.msg.reversed);
            msgStreakList.add(msgStreak);
            msgStreak = MessageStreak(isDoctor: i['isDoctor']);
            prev = msgStreak.isDoctor;
          }
          msgStreak.addMsg(i['text']);
        }
        msgStreak.msg = List.from(msgStreak.msg.reversed);
        msgStreakList.add(msgStreak);

        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, index) {
            if (msgStreakList[index].isDoctor) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClientMessageBubble(messageStreak: msgStreakList[index].msg),
                ],
              );
            } else {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyBubbleMessage(messageStreak: msgStreakList[index].msg),
                ],
              );
            }
          },
          itemCount: msgStreakList.length,
        );
      },
    );
  }
}
