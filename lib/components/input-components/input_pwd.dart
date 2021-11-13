import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController pwdController;
  final bool isSecure;
  final String label;
  final bool isPwdError;
  final String errorMsg;
  final Function viewPassword;
  final Function removePwdWarning;

  InputPassword(
      {required this.label,
      required this.pwdController,
      required this.isSecure,
      required this.isPwdError,
      required this.errorMsg,
      required this.viewPassword,
      required this.removePwdWarning});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: pwdController,
        onTap: () => removePwdWarning(),
        obscureText: isSecure,
        decoration: InputDecoration(
          errorText: isPwdError ? errorMsg : null,
          suffix: GestureDetector(
            child: Icon(
              isSecure ? Icons.remove_red_eye : Icons.shield,
            ),
            onTap: () => viewPassword(),
          ),
          label: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
