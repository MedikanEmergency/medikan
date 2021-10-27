import 'package:flutter/material.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/themes/theme_data.dart';

class InputMessage extends StatelessWidget {
  TextEditingController message = TextEditingController();
  void _sendMessage() {}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.075,
      // padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        border: Border.all(color: ColorData.onPrimary),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: message,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    hintText: "Aa",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red.withOpacity(0)))),
              ),
            ),
            IconButton(onPressed: _sendMessage, icon: Icon(MyFlutterApp.send))
          ],
        ),
      ),
    );
  }
}
