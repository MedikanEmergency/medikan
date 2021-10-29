import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class ClientMessageBubble extends StatelessWidget {
  final List<String> messageStreak;
  List<Widget> _bubbleList = [];
  ClientMessageBubble({required this.messageStreak}) {
    for (int i = 0; i < messageStreak.length; i++) {
      if (messageStreak.length == 1) {
        _bubbleList.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 1),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorData.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              messageStreak[i],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
      // there are many messages in the streak and this is for the 1st msg
      else if (i == 0) {
        _bubbleList.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 1),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorData.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Text(
              messageStreak[i],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
      // there are messages in the streak and this is for the last msg
      else if (i == messageStreak.length - 1) {
        _bubbleList.add(Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ColorData.primary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15)),
          ),
          child: Text(
            messageStreak[i],
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
      // there are messages in the streak and this is for msgs between 1st and last
      else {
        _bubbleList.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 1),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorData.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15)),
            ),
            child: Text(
              messageStreak[i],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      constraints: BoxConstraints(
        maxWidth: size.width * 0.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/psycho_op.jpg"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _bubbleList,
            ),
          )
        ],
      ),
    );
  }
}
