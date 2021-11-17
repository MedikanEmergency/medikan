import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class InputName extends StatelessWidget {
  final TextEditingController nameController;
  final Function removeNameWarning;
  final bool isNameError;
  final String errorMsg;
  InputName(
      {required this.nameController,
      required this.isNameError,
      required this.removeNameWarning,
      required this.errorMsg});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: nameController,
        onTap: () => removeNameWarning(),
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          errorText: isNameError ? errorMsg : null,
          label: Text(
            "Họ và tên",
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
