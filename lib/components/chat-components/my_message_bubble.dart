import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class MyBubbleMessage extends StatelessWidget {
  final List<String> messageStreak;
  MyBubbleMessage({required this.messageStreak}) {
    for (int i = 0; i < messageStreak.length; i++) print(messageStreak[i]);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...messageStreak.map(
            (msg) {
              // only 1 message in streak
              if (messageStreak.length == 1) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              // there are many messages in the streak and this is for the 1st msg
              else if (messageStreak.indexOf(msg) == 0) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorData.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              // there are messages in the streak and this is for the last msg
              else if (messageStreak.indexOf(msg) == messageStreak.length - 1) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorData.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(5)),
                  ),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              // there are messages in the streak and this is for msgs between 1st and last
              else {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorData.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
