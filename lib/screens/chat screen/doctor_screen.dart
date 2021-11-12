import 'package:flutter/material.dart';
import 'package:medikan/components/chat-components/message_tile.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/themes/theme_data.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List<bool> isRead = [true, false];
  void readMessage(int id) {
    isRead[id] = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        title: Text(
          "Nhắn tin",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            MessageTile(
              id: 0,
              name: "hoang",
              message: "Làm sao có thể chữa được tất cả các bệnh UwUsfewiofwe",
              isRead: isRead[0],
              readMessage: readMessage,
            ),
            MessageTile(
              id: 1,
              name: "hoang",
              message: "Làm sao có thể chữa được tất cả các bệnh UwUsfewiofwe",
              isRead: isRead[1],
              readMessage: readMessage,
            ),
          ],
        ),
      ),
    );
  }
}
