import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/components/input-components/input_phone.dart';
import 'package:medikan/components/input-components/input_pwd.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/screens/main_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordSecure = true;
  bool _isPhoneError = false;
  bool _isPasswordError = false;

  String _phoneError = "";
  String _passwordError = "";
  bool isSuccess = false;

  final _auth = Get.find<FirebaseAuth>();
  var _userState = null;
  final _store = Get.find<FirebaseFirestore>();

  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  void viewPassword() {
    _passwordSecure = !_passwordSecure;
    setState(() {});
  }

  @override
  void initState() {
    try {
      _userState = Get.find<AuthInfo>();
    } catch (e) {
      _userState = Get.put(AuthInfo());
    }
    super.initState();
  }

  void removePhoneWarning() {
    _isPhoneError = false;
    setState(() {});
  }

  void removePasswordWarning() {
    _isPasswordError = false;
    setState(() {});
  }

  void login(BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(message: "Đang đăng nhập");

    if (validateInput()) {
      var email = _phone.text + "@gmail.com";
      try {
        dialog.show();
        await _auth
            .signInWithEmailAndPassword(email: email, password: _password.text)
            .then(
          (value) {
            print(_auth.currentUser?.uid);
            isSuccess = true;
          },
        );
        if (isSuccess) {
          dialog.hide();

          // check if this is doctor
          await _store
              .collection('account')
              .doc('${_auth.currentUser!.uid}')
              .get()
              .then((value) {
            var temp = value.data()!['is_doctor'].toString();
            print(temp);
            _userState.setDoctor(temp == 'true');
          });

          _userState.setPhone(_phone.text);
          _userState.setPassword(_password.text);

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
            // MaterialPageRoute(
            //   builder: (_) => MainScreen(),
            // ),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (dialog.isShowing()) dialog.hide();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Đăng nhập thất bại",
              style: TextStyle(
                color: ColorData.background,
              ),
            ),
            backgroundColor: ColorData.primaryVariant,
          ),
        );
        if (e.code == 'user-not-found') {
          _phoneError = 'Số điện thoại không tồn tại, vui lòng kiểm tra lại';
          _isPhoneError = true;
          setState(() {});
        } else if (e.code == 'wrong-password') {
          _passwordError = 'Mật khẩu không đúng, vui lòng kiểm tra lại';
          _isPasswordError = true;
          setState(() {});
        }
      }
    }
    if (dialog.isShowing()) dialog.hide();
  }

  bool validateInput() {
    bool isValid = true;
    if (_phone.text.length == 0) {
      _isPhoneError = true;
      _phoneError = "Không được để trống \"Số điện thoại\"";
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

  var LoginAppBar = AppBar(
    title: Text(
      "Đăng nhập",
      style: FontStyleData.H1_bold_36,
    ),
    backgroundColor: ColorData.secondary,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height -
        LoginAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
        appBar: LoginAppBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                InputPhone(
                  phoneController: _phone,
                  isPhoneError: _isPhoneError,
                  errorMessage: _phoneError,
                  removeWarning: removePhoneWarning,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                InputPassword(
                  label: "Mật khẩu",
                  pwdController: _password,
                  isSecure: _passwordSecure,
                  isPwdError: _isPasswordError,
                  errorMsg: _passwordError,
                  viewPassword: viewPassword,
                  removePwdWarning: removePasswordWarning,
                ),
                //Quên mk
                SizedBox(
                  height: height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                            color: ColorData.clickable,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: height * 0.12,
                ),
                DoneButton(
                  width: size.width,
                  height: height,
                  func: () => login(context),
                  label: "Đăng nhập",
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //Chưa có tk, dki

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Chưa có tài khoản? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 700),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.ease);
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return SignUpScreen();
                              }),
                        );
                        // MaterialPageRoute(
                        //   builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Đăng kí",
                        style: TextStyle(
                            color: ColorData.clickable,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
