import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medikan/components/confirm_chat_button.dart';
import 'package:medikan/themes/theme_data.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Số lần nhắn tin còn lại trong ngày",
                  style: FontStyleData.H2_bold_30,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "3",
                  style: TextStyle(
                      color: ColorData.primary,
                      fontSize: 75,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ConfirmChatButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
