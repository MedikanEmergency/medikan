import 'package:flutter/material.dart';
import 'package:medikan/components/authen_components/cancel_button.dart';
import 'package:medikan/components/authen_components/done_button.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/otp_screen.dart';
import 'package:medikan/themes/theme_data.dart';

class ForgotPwdScreen extends StatefulWidget {
  @override
  State<ForgotPwdScreen> createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  TextEditingController _phone = TextEditingController();

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

  void validatePhone() {
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
    if (isValid) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => OtpScreen(num: _phone.text)));
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
