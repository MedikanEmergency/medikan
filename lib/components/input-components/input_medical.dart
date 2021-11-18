import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class InputMedical extends StatelessWidget {
  final TextEditingController phoneController;
  final bool isPhoneError;
  final String errorMessage;
  final Function removeWarning;
  final String label;
  final String inputType;
  final bool enabled;

  InputMedical({
    required this.phoneController,
    required this.isPhoneError,
    required this.errorMessage,
    required this.removeWarning,
    required this.label,
    required this.inputType,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        enabled: enabled,
        controller: phoneController,
        onTap: () => removeWarning(),
        maxLength: 10,
        keyboardType: inputType == 'number' ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          counterText: "",
          errorText: isPhoneError ? errorMessage : null,
          label: Text(
            label,
            style: TextStyle(
              fontSize: 18,
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
