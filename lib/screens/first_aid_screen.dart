import 'package:flutter/material.dart';
import 'package:medikan/components/first_aid_components/first_aid.dart';
import 'package:medikan/icons.dart';
import '../themes/theme_data.dart';

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
      body: Container(
        child: 
          FirstAids(),
      ),
    );
  }
}
