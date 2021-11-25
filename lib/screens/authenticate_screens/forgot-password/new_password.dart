import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/authen_components/cancel_button.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/components/input-components/input_pwd.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import 'package:medikan/screens/main_screen.dart';
import 'package:medikan/themes/theme_data.dart';

class NewPassword extends StatefulWidget {
  final isForgot;
  NewPassword({required this.isForgot});
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  FirebaseAuth _auth = Get.find<FirebaseAuth>();
  FirebaseFirestore firestore = Get.find<FirebaseFirestore>();
  TextEditingController _pwdController = TextEditingController();
  bool _isPwdError = false;
  bool _isPwdSecure = true;
  String _pwdErrorMsg = "";

  TextEditingController _rePwdController = TextEditingController();
  bool _isRePwdError = false;
  bool _isRePwdSecure = true;
  String _rePwdErrorMsg = "";

  void viewPwd() {
    _isPwdSecure = !_isPwdSecure;
    setState(() {});
  }

  void viewRePwd() {
    _isRePwdSecure = !_isRePwdSecure;
    setState(() {});
  }

  void removePwdWarning() {
    _isPwdError = false;
    setState(() {});
  }

  void removeRePwdWarning() {
    _isRePwdError = false;
    setState(() {});
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  bool validatePassword() {
    if (_pwdController.text != _rePwdController.text) {
      _isRePwdError = true;
      _rePwdErrorMsg = "Mật khẩu nhập lại không trùng khớp";
      return false;
    }

    if (_pwdController.text.length <= 4) {
      _isPwdError = true;
      _pwdErrorMsg = "Mật khẩu phải nhiều hơn 4 ký tự";
      return false;
    }

    return true;
  }

  void done() async {
    if (validatePassword()) {
      await _auth.currentUser!
          .updatePassword(_pwdController.text)
          .then((value) {
        firestore.collection('account').doc(_auth.currentUser!.uid).update(
          {
            'password': _pwdController.text,
          },
        );
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
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
                return MainScreen();
              }),
        );
      });
    } else {
      setState(() {});
    }
  }

  PreferredSizeWidget appBar = AppBar(
    title: Text(
      "Quên mật khẩu",
      style: FontStyleData.H1_bold_36,
    ),
    backgroundColor: ColorData.secondary,
    iconTheme: IconThemeData(color: ColorData.onPrimary),
  );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    return SafeArea(
      child: Scaffold(
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.15,
                ),
                Center(
                    child: Text(
                  "Cập nhật mật khẩu",
                  style: FontStyleData.H2_bold_30,
                )),
                SizedBox(
                  height: height * 0.1,
                ),
                InputPassword(
                    label: "Nhập mật khẩu mới",
                    pwdController: _pwdController,
                    isSecure: _isPwdSecure,
                    isPwdError: _isPwdError,
                    errorMsg: _pwdErrorMsg,
                    viewPassword: viewPwd,
                    removePwdWarning: removePwdWarning),
                SizedBox(
                  height: height * 0.05,
                ),
                InputPassword(
                    label: "Nhập lại mật khẩu mới",
                    pwdController: _rePwdController,
                    isSecure: _isRePwdSecure,
                    isPwdError: _isRePwdError,
                    errorMsg: _rePwdErrorMsg,
                    viewPassword: viewRePwd,
                    removePwdWarning: removeRePwdWarning),
                SizedBox(
                  height: height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CancelButton(
                      func: cancel,
                      height: height,
                      width: width,
                      label: "Hủy",
                    ),
                    DoneButton(
                      width: width,
                      height: height,
                      func: done,
                      label: "Xong",
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
