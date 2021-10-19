import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/components/sos_button.dart';
import 'package:medikan/icons.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyFlutterApp.list,
              color: ColorData.onPrimary,
            ),
          )
        ],
        title: Text(
          "Mẹo và tin tức",
          style: FontStyleData.H1_bold_36,
        ),
        backgroundColor: ColorData.secondary,
      ),
      body: Center(
        child: Text("News"),
      ),
    );
  }
}
