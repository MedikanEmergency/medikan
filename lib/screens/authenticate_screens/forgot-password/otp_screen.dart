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
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  FirebaseAuth firebaseAuth = Get.find<FirebaseAuth>();
  FirebaseFirestore firebaseStore = Get.find<FirebaseFirestore>();
  final authState = Get.find<AuthInfo>();

  String verificationId;
  String _phoneNum = "";
  String _password = "";
  OtpScreen({required this.verificationId}) {
    // get saved phone and password
    _phoneNum = authState.phone.toString();
    _password = authState.password.toString();
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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

  void createPhonePassword() {
    var email = widget._phoneNum + "@gmail.com";
    final credential =
        EmailAuthProvider.credential(email: email, password: widget._password);
    widget.firebaseAuth.currentUser?.linkWithCredential(credential);
  }

  void createAccountDocument(uid) {
    widget.firebaseStore.collection('account').doc(uid).set(
      {
        'is_doctor': false,
        'password': widget._password,
      },
    );
    widget.firebaseStore
        .collection('account')
        .doc(uid)
        .collection('medical-info');
    widget.firebaseStore.collection('conversations').doc(uid).set(
      {
        'chat_time': 3,
        'modified_time': Timestamp.now(),
        'latest_message_time': Timestamp.now(),
        'latest_message': "",
        'is_read': true,
        'id': uid,
        'name': widget.authState.getName(),
      },
    );
  }

  void next() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: _controller.text);
    try {
      final authCredential =
          await widget.firebaseAuth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        createPhonePassword();
        createAccountDocument(authCredential.user?.uid);
        Navigator.push(
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
                return LoginScreen();
              }),
          // MaterialPageRoute(
          //   builder: (context) => LoginScreen(),
          // ),
        );
      }
    } on FirebaseAuthException catch (e) {
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
