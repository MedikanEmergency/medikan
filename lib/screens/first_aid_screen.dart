import 'package:flutter/material.dart';
import 'package:medikan/icons.dart';
import '../Themes/theme_data.dart';

class FirstAid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        title: Text(
          "Sơ cấp cứu",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Center(
        child: Text("First Aid"),
      ),
    );
  }
}
