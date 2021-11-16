import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medikan/components/authen_components/cancel_button.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/components/input-components/input_otp.dart';
import 'package:medikan/components/authen_components/resent_text.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  FirebaseAuth firebaseAuth;
  String _num;
  String verificationId;
  OtpScreen(
      {required num, required this.verificationId, required this.firebaseAuth})
      : _num = num {
    _num = _num.replaceRange(6, 12, "xxxxxx");
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? timer;
  TextEditingController _controller = TextEditingController();
  int _second = 10;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  bool startListening() {
    if (_controller.text.length != 0 && _controller.text == "1234") return true;
    return false;
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _second--;
      setState(() {});
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void next() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: _controller.text);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (ctx) {
    //       return Scaffold();
    //     },
    //   ),
    // );
    try {
      final authCredential =
          await widget.firebaseAuth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        final credential = EmailAuthProvider.credential(
            email: "0918869175@gmail.com", password: "123456");
        widget.firebaseAuth.currentUser?.linkWithCredential(credential);
        print("we did it");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print("something's wrong");
    }
  }

  bool validateOTP(String? otp) {
    print("validating");
    if (otp == "1234") return true;
    return false;
  }

  void re_sentOTP() {
    _second = 10;
    startTimer();
    setState(() {});
  }

  PreferredSizeWidget appBar = AppBar(
    title: Text(
      "Xác thực",
      style: FontStyleData.H1_bold_36,
    ),
    backgroundColor: ColorData.secondary,
    iconTheme: IconThemeData(color: ColorData.onPrimary),
  );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Future(() {
      if (startListening()) next(); // move on
    });
    Future(() {
      if (_second == 0) stopTimer();
    });
    return SafeArea(
      child: Scaffold(
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                SizedBox(height: height * 0.2),
                Text(
                  "Nhập mã OTP đã được gửi tới số\n${widget._num}",
                  style: FontStyleData.H3_bold_36,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.15),
                InputOTP(
                  controller: _controller,
                  otpLength: 6,
                ),
                SizedBox(height: height * 0.02),
                Center(
                    child: ResentOTPText(
                  re_sentOTP: re_sentOTP,
                  second: _second,
                )),
                SizedBox(height: height * 0.1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CancelButton(
                        width: width,
                        height: height,
                        func: cancel,
                        label: "Hủy bỏ",
                      ),
                      DoneButton(
                        width: width,
                        height: height,
                        func: next,
                        label: "Tiếp tục",
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
