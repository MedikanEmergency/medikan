import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medikan/screens/chatting_screen.dart';
import 'package:medikan/themes/theme_data.dart';

class ConfirmChatButton extends StatelessWidget {
  void startChatting(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ChattingScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ElevatedButton(
          child: Text(
            "Bắt đầu ngay",
            style: TextStyle(
                color: ColorData.background,
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => startChatting(context),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              primary: ColorData.primary,
              fixedSize: Size(
                constraints.maxWidth * 0.6,
                constraints.maxWidth * 0.15,
              ),
              elevation: ElevationData.elevated15),
        );
      },
    );
  }
}
