// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/components/input-components/input_name.dart';
import 'package:medikan/components/input-components/input_phone.dart';
import 'package:medikan/components/input-components/input_pwd.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/otp_screen.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final authState = Get.put(AuthInfo());

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

  final FirebaseAuth firebaseAuth = Get.find<FirebaseAuth>();

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

  Future<void> createAccountByPhone(context) async {
    try {
      ProgressDialog progressDialog = ProgressDialog(context);
      progressDialog.style(
        message: "Vui l??ng ch???",
      );
      var phoneTmp = _phone.text.replaceRange(0, 1, "+84");
      print(phoneTmp);
      progressDialog.show();
      await firebaseAuth.verifyPhoneNumber(
        timeout: Duration(minutes: 2),
        phoneNumber: phoneTmp,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
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
                "????ng k?? th???t b???i, vui l??ng th??? l???i sau",
                style: TextStyle(color: ColorData.background),
              ),
              backgroundColor: ColorData.primaryVariant,
            ),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          print("check for code ${resendToken}}");
          progressDialog.hide();
          authState.setPhone(_phone.text);
          authState.setPassword(_password.text);
          authState.setName(_name.text);
          Navigator.of(context).push(
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
                  return OtpScreen(verificationId: verificationId);
                }),
            // MaterialPageRoute(
            //   builder: (_) => OtpScreen(
            //     verificationId: verificationId,
            //   ),
            // ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print("\n\n\n\nsomething wrong\n\n\n");
      print(e.message);
    }
  }

  void validateInput(context) async {
    var isPassName = validateName();
    var isPassPhone = validatePhone();
    var isPassPwd = validatePassword();

    setState(() {});
    if (isPassPwd && isPassName && isPassPhone) {
      await createAccountByPhone(context);
    }
  }

  bool validateName() {
    if (_name.text.isEmpty) {
      _isNameError = true;
      _nameError = "Kh??ng ???????c ????? tr???ng \"H??? v?? t??n\"";
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (_password.text != _rePassword.text) {
      _isRePasswordError = true;
      _rePasswordError = "M???t kh???u nh???p l???i kh??ng tr??ng kh???p";
      return false;
    }

    if (_password.text.length <= 4) {
      _isPasswordError = true;
      _passwordError = "M???t kh???u ph???i nhi???u h??n 4 k?? t???";
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
      _phoneError = "S??? ??i???n tho???i kh??ng h???p l???";
      return false;
    }

    return true;
  }

  var signUpAppBar = AppBar(
    title: Text(
      "????ng k??",
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
        resizeToAvoidBottomInset: false,
        appBar: signUpAppBar,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.05,
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
                label: "M???t kh???u",
                pwdController: _password,
                removePwdWarning: removePasswordWarning,
                viewPassword: viewPassword,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InputPassword(
                label: "Nh???p l???i m???t kh???u",
                pwdController: _rePassword,
                isSecure: _rePasswordSecure,
                isPwdError: _isRePasswordError,
                errorMsg: _rePasswordError,
                viewPassword: viewRe_password,
                removePwdWarning: removeRe_passwordWarning,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Align(
                child: DoneButton(
                    width: size.width,
                    height: height,
                    func: () => validateInput(context),
                    label: "????ng k??"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("???? c?? t??i kho???n? ",
                        style: TextStyle(
                            color: ColorData.onPrimary,
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400)),
                    TextButton(
                      onPressed: () {
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
                                return LoginScreen();
                              }),
                        );
                        // MaterialPageRoute(
                        //   builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "????ng nh???p",
                        style: TextStyle(
                            color: ColorData.clickable,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
