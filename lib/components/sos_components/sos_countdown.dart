import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class CountDown extends StatelessWidget {
  const CountDown({
    Key? key,
    required this.width,
    required this.second,
    required this.timer,
    required this.height,
  }) : super(key: key);

  final double width;
  final int second;
  final Timer? timer;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: width * 0.75,
      height: width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorData.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   height: height * 0.05,
          // ),
          Text(
            second != 0
                ? "Tin nhắn S.O.S sẽ được gửi trong"
                : "Tin nhắn S.O.S đã được gửi",
            style: FontStyleData.H1_bold_36,
            textAlign: TextAlign.center,
          ),
          Text(
            second != 0 ? "$second" : "",
            style: TextStyle(
                fontSize: 65,
                color: second <= 3 ? ColorData.sos : ColorData.primaryVariant,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              if (second != 0) {
                timer?.cancel();
              }
              Navigator.of(context).pop();
            },
            child: Text(
              second != 0 ? "Huỷ" : "Quay về",
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                primary: ColorData.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                ),
                fixedSize: Size(width * 0.4, height * 0.05),
                elevation: 10),
          )
        ],
      ),
    );
  }
}
