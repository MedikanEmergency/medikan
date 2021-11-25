import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/authen_components/cancel_button.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/components/input-components/input_otp.dart';
import 'package:medikan/components/authen_components/resent_text.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/new_password.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:progress_dialog/progress_dialog.dart';

class OtpForgotScreen extends StatefulWidget {
  FirebaseAuth firebaseAuth = Get.find<FirebaseAuth>();
  FirebaseFirestore firebaseStore = Get.find<FirebaseFirestore>();
  final authState = Get.find<AuthInfo>();

  String verificationId;
  String _phoneNum = "";
  String _password = "";
  OtpForgotScreen({required this.verificationId, required phone}) {
    // get saved phone and password
    _phoneNum = phone;
  }

  @override
  State<OtpForgotScreen> createState() => _OtpForgotScreenState();
}

class _OtpForgotScreenState extends State<OtpForgotScreen> {
  Timer? timer;
  final TextEditingController _controller = TextEditingController();
  int _second = 10;
  @override
  void initState() {
    super.initState();
    startTimer();
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
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: "Vui lòng chờ",
    );
    progressDialog.show();
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: _controller.text);
    try {
      final authCredential =
          await widget.firebaseAuth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        progressDialog.hide();
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 700),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation =
                    CurvedAnimation(parent: animation, curve: Curves.ease);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return NewPassword(
                  label: "Quên mật khẩu",
                  isForgot: true,
                );
              }),
          // MaterialPageRoute(
          //   builder: (context) => LoginScreen(),
          // ),
        );
      }
    } on FirebaseAuthException catch (e) {
      progressDialog.hide();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Xác nhận thất bại, vui lòng kiểm tra lại OTP"),
        ),
      );
    }
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
                "Nhập mã OTP đã được gửi tới số\n${widget._phoneNum}",
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
        ),
      ),
    );
  }
}
