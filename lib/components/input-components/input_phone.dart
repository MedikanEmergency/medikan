import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class InputPhone extends StatelessWidget {
  final TextEditingController phoneController;
  final bool isPhoneError;
  final String errorMessage;
  final Function removeWarning;

  InputPhone({
    required this.phoneController,
    required this.isPhoneError,
    required this.errorMessage,
    required this.removeWarning,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: phoneController,
        onTap: () => removeWarning(),
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          errorText: isPhoneError ? errorMessage : null,
          label: Text(
            "Số điện thoại",
            style: TextStyle(
              fontSize: 20,
              color: ColorData.inactive,
            ),
          ),
          border: OutlineInputBorder(),
          focusColor: ColorData.primaryVariant,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorData.primaryVariant,
              width: 1.75,
            ),
          ),
        ),
      ),
    );
  }
}
