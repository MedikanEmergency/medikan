import 'package:flutter/material.dart';
import 'package:medikan/Themes/theme_data.dart';
import 'package:medikan/icons.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyFlutterApp.setting,
                color: ColorData.onPrimary,
              ))
        ],
        title: Text(
          "Tài khoản của bạn",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Center(
        child: Text("Personal Infor"),
      ),
    );
  }
}
