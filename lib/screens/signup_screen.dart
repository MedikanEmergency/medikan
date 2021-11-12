// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medikan/icons.dart';
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

  bool validateInput() {
    bool isValid = true;
    if (_name.text.length == 0) {
      _isNameError = true;
      _nameError = "Không được để trống \"Họ và tên\"";
      isValid = false;
    }
    if (_password.text != _rePassword.text) {
      _isRePasswordError = true;
      _rePasswordError = "Mật khẩu nhập lại không trùng khớp";
      isValid = false;
    }

    if (_password.text.length <= 4) {
      _isPasswordError = true;
      _passwordError = "Mật khẩu phải nhiều hơn 4 ký tự";
      isValid = false;
    }

    RegExp regExp = RegExp(
        r"^(0|\+84)(\s|\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})$");
    var matches = regExp.allMatches(_phone.text);
    if (matches.length < 1) {
      _isPhoneError = true;
      _phoneError = "Số điện thoại không hợp lệ";
      isValid = false;
    }

    setState(() {});
    return isValid;
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
            Form(
              child: TextFormField(
                controller: _name,
                onTap: removeNameWarning,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  errorText: _isNameError ? _nameError : null,
                  label: Text(
                    "Họ và tên",
                    style: TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Form(
              child: TextFormField(
                controller: _phone,
                onTap: removePhoneWarning,
                maxLength: 10,
                keyboardType: TextInputType.number,
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
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Form(
              child: TextFormField(
                controller: _password,
                onTap: removePasswordWarning,
                obscureText: _passwordSecure,
                decoration: InputDecoration(
                  errorText: _isPasswordError ? _passwordError : null,
                  suffix: GestureDetector(
                    child: Icon(
                      _passwordSecure ? Icons.remove_red_eye : Icons.shield,
                    ),
                    onTap: viewPassword,
                  ),
                  label: Text(
                    "Mật khẩu",
                    style: TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Form(
              child: TextFormField(
                controller: _rePassword,
                onTap: removeRe_passwordWarning,
                obscureText: _rePasswordSecure,
                decoration: InputDecoration(
                  suffix: GestureDetector(
                    child: Icon(
                      _rePasswordSecure ? Icons.remove_red_eye : Icons.shield,
                    ),
                    onTap: viewRe_password,
                  ),
                  errorText: _isRePasswordError ? _rePasswordError : null,
                  label: Text(
                    "Nhập lại mật khẩu",
                    style: TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Align(
              child: ElevatedButton(
                onPressed: () {
                  if (validateInput()) {
                    // move on
                  }
                },
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: ColorData.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: Size(
                    size.width * 0.4,
                    height * 0.075,
                  ),
                ),
              ),
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
