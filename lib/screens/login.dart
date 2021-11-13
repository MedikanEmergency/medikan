import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';

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

  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  void viewPassword() {
    _passwordSecure = !_passwordSecure;
    setState(() {});
  }

  void removePhoneWarning() {
    _isPhoneError = false;
    setState(() {});
  }
  void removePasswordWarning() {
    _isPasswordError = false;
    setState(() {});
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
  // final loginButton = Material(
  //     elevation: 5,
  //     borderRadius: BorderRadius.circular(20),
  //     color: ColorData.primaryVariant,
  //     child: MaterialButton(
  //       onPressed: () {
  //         if (validateInput()) {
  //                   // move on
  //                 }
  //       },
  //       child: Text(
  //         'Đăng nhập',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
  //     ));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height -
        LoginAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
        appBar: LoginAppBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.17,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 15),
                child: TextFormField(
                  controller: _phone,
                  onTap: removePhoneWarning,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: "",
                    labelText: 'Số điện thoại',
                    hintText: 'Enter your phone...',
                    errorText: _isPhoneError ? _phoneError : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 20),
                child: TextFormField(
                  controller: _password,
                  onTap: removePasswordWarning,
                  obscureText: _passwordSecure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password...',
                    errorText: _isPasswordError ? _passwordError : null,
                    suffix: GestureDetector(
                    child: Icon(
                      _passwordSecure ? Icons.remove_red_eye : Icons.shield,
                    ),
                    onTap: viewPassword,
                  ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    
                  ),
                ),
              ),
              //Quên mk
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.04,
                  ),
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
              //Dang nhap Button
              //loginButton,
              Material(
                elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: ColorData.primaryVariant,
      child: MaterialButton(
        onPressed: () {
          if (validateInput()) {
                    // move on
                  }
        },
        child: Text(
          'Đăng nhập',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
              )),
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
                      onTap: () {},
                      child: Text(
                        "Đăng kí",
                        style: TextStyle(
                            color: ColorData.clickable,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ]),
            ],
          ),
        ));
  }
}
