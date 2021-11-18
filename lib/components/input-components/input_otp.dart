import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InputOTP extends StatelessWidget {
  final controller;
  final otpLength;
  InputOTP({required this.controller, required this.otpLength});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: PinCodeTextField(
        controller: controller,
        keyboardType: TextInputType.number,
        appContext: context,
        length: otpLength,
        onChanged: (value) {},
        pinTheme: PinTheme.defaults(
          inactiveColor: ColorData.primary,
        ),
      ),
    );
  }
}
