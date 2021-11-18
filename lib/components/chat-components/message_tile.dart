// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medikan/screens/chat%20screen/chatting_screen.dart';
import 'package:medikan/themes/theme_data.dart';

import '../../icons.dart';

class MessageTile extends StatelessWidget {
  final int id;
  final String name;
  final String message;
  final bool isRead;
  final Function readMessage;

  MessageTile(
      {required this.id,
      required this.name,
      required this.message,
      required this.isRead,
      required this.readMessage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: Image.asset("assets/images/psycho_op.jpg").image,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              name,
              style: FontStyleData.H2_bold_30,
            ),
          ),
          subtitle: Text(
            message,
            style: FontStyleData.Paragraph_Regular_20,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: !isRead
                ? Icon(
                    MyFlutterApp.envelope,
                    color: ColorData.primary,
                  )
                : Icon(
                    MyFlutterApp.open_envelope,
                    color: ColorData.primary,
                  ),
            onPressed: () {},
          ),
          onTap: () => {
            readMessage(id),
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ChattingScreen();
            }))
          },
        ),
      ),
    );
  }
}
