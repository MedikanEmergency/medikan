import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class ResentOTPText extends StatelessWidget {
  final second;
  final Function re_sentOTP;
  ResentOTPText({required this.second, required this.re_sentOTP});
  String convert_second(int s) {
    if (s >= 10) return "(${(second / 60).toInt()}:${second % 60})";
    return "(${(second / 60).toInt()}:0${second % 60})";
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Không nhận được mã? ", style: FontStyleData.Title_Bold_20),
        TextSpan(
          text: "Gửi lại! ",
          style: TextStyle(
              color: ColorData.clickable,
              fontWeight: FontWeight.bold,
              fontSize: 20),
          recognizer: TapGestureRecognizer()
            ..onTap = second == 0 ? () => re_sentOTP : null,
        ),
        TextSpan(
            text: second != 0 ? convert_second(second) : null,
            style: TextStyle(color: ColorData.onPrimary, fontSize: 20))
      ]),
    );
  }
}
