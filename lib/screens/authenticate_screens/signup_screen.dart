// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/components/input-components/input_name.dart';
import 'package:medikan/components/input-components/input_phone.dart';
import 'package:medikan/components/input-components/input_pwd.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/themes/theme_data.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordSecure = true;
  bool _rePasswordSecure = true;

  bool _isPasswordError = false;
  bool _isRePasswordError = false;
  bool _isPhoneError = false;
  bool _isNameError = false;

  String _passwordError = "";
  String _rePasswordError = "";
  String _phoneError = "";
  String _nameError = "";

  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _name = TextEditingController();
  void viewPassword() {
    _passwordSecure = !_passwordSecure;
    setState(() {});
  }

  void viewRe_password() {
    _rePasswordSecure = !_rePasswordSecure;
    setState(() {});
  }

  void removeRe_passwordWarning() {
    _isRePasswordError = false;
    setState(() {});
  }

  void removePasswordWarning() {
    _isPasswordError = false;
    setState(() {});
  }

  void removePhoneWarning() {
    _isPhoneError = false;
    setState(() {});
  }

  void removeNameWarning() {
    _isNameError = false;
    setState(() {});
  }

  void validateInput() {
    var isPassName = validateName();
    var isPassPhone = validatePhone();
    var isPassPwd = validatePassword();

    setState(() {});
    if (isPassPwd && isPassName && isPassPhone)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => Login(),
        ),
      );
  }

  bool validateName() {
    if (_name.text.isEmpty) {
      _isNameError = true;
      _nameError = "Không được để trống \"Họ và tên\"";
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (_password.text != _rePassword.text) {
      _isRePasswordError = true;
      _rePasswordError = "Mật khẩu nhập lại không trùng khớp";
      return false;
    }

    if (_password.text.length <= 4) {
      _isPasswordError = true;
      _passwordError = "Mật khẩu phải nhiều hơn 4 ký tự";
      return false;
    }

    return true;
  }

  bool validatePhone() {
    RegExp regExp = RegExp(
        r"^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$");
    var matches = regExp.allMatches(_phone.text);
    if (matches.isEmpty) {
      _isPhoneError = true;
      _phoneError = "Số điện thoại không hợp lệ";
      return false;
    }

    return true;
  }

  var signUpAppBar = AppBar(
    title: Text(
      "Đăng ký",
      style: FontStyleData.H1_bold_36,
    ),
    backgroundColor: ColorData.secondary,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height -
        signUpAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: signUpAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            InputName(
              nameController: _name,
              isNameError: _isNameError,
              removeNameWarning: removeNameWarning,
              errorMsg: _nameError,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            InputPhone(
              removeWarning: removePhoneWarning,
              errorMessage: _phoneError,
              isPhoneError: _isPhoneError,
              phoneController: _phone,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            InputPassword(
              errorMsg: _passwordError,
              isPwdError: _isPasswordError,
              isSecure: _passwordSecure,
              label: "Mật khẩu",
              pwdController: _password,
              removePwdWarning: removePasswordWarning,
              viewPassword: viewPassword,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            InputPassword(
              label: "Nhập lại mật khẩu",
              pwdController: _rePassword,
              isSecure: _rePasswordSecure,
              isPwdError: _isRePasswordError,
              errorMsg: _rePasswordError,
              viewPassword: viewRe_password,
              removePwdWarning: removeRe_passwordWarning,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Align(
              child: DoneButton(
                  width: size.width,
                  height: height,
                  func: validateInput,
                  label: "Đăng ký"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: RichText(
                    text: TextSpan(
                        style: FontStyleData.Paragraph_Regular_20,
                        children: [
                      TextSpan(text: "Đã có tài khoản? "),
                      TextSpan(
                          text: "Đăng nhập",
                          style: TextStyle(
                              color: ColorData.clickable,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
