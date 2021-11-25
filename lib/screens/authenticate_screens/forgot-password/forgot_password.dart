import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/authen_components/cancel_button.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/otp_forgot.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/otp_screen.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ForgotPwdScreen extends StatefulWidget {
  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  TextEditingController _phone = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isPhoneError = false;

  String _phoneError = "";

  PreferredSizeWidget appBar = AppBar(
    title: Text(
      "Quên mật khẩu",
      style: FontStyleData.H1_bold_36,
    ),
    backgroundColor: ColorData.secondary,
    iconTheme: IconThemeData(color: ColorData.onPrimary),
  );
  void cancel() {
    Navigator.of(context).pop();
  }

  void validatePhone() async {
    bool isValid = true;
    RegExp regExp = RegExp(
        r"^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$");
    var matches = regExp.allMatches(_phone.text);
    if (matches.isEmpty) {
      _isPhoneError = true;
      _phoneError = "Số điện thoại không hợp lệ";
      isValid = false;
    }

    setState(() {});
    var phoneTmp = _phone.text.replaceRange(0, 1, "+84");
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: "Vui lòng chờ",
    );
    if (isValid) {
      progressDialog.show();
      try {
        await _auth.verifyPhoneNumber(
          timeout: Duration(minutes: 2),
          phoneNumber: phoneTmp,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            print("Helloooooo");
            // firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException authException) async {
            print("\n\n\nFailed\n\n");
            print(authException.message);
            progressDialog.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Đăng ký thất bại, vui lòng thử lại sau",
                  style: TextStyle(color: ColorData.background),
                ),
                backgroundColor: ColorData.primaryVariant,
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            print("check for code ${resendToken}}");
            progressDialog.hide();
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 700),
                  transitionsBuilder:
                      (context, animation, animationTime, child) {
                    animation =
                        CurvedAnimation(parent: animation, curve: Curves.ease);
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return OtpForgotScreen(
                      verificationId: verificationId,
                      phone: _phone.text,
                    );
                  }),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } on FirebaseAuthException catch (e) {
        print("\n\n\n\nsomething wrong\n\n\n");
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;
    return Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              SizedBox(height: height * 0.2),
              Center(
                child: Text(
                  "Nhập số điện thoại đã đăng ký:",
                  style: FontStyleData.H3_bold_36,
                ),
              ),
              SizedBox(height: height * 0.15),
              TextField(
                onTap: () {
                  if (_isPhoneError) _isPhoneError = false;
                  setState(() {});
                },
                controller: _phone,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  errorText: _isPhoneError ? _phoneError : null,
                  label: Text(
                    "Số điện thoại",
                    style: TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: height * 0.15),
              Row(
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
                    func: validatePhone,
                    label: "Tiếp",
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
