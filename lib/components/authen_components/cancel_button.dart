import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class CancelButton extends StatelessWidget {
  final double width;
  final double height;
  final Function func;
  final String label;
  CancelButton(
      {required this.width,
      required this.height,
      required this.func,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => func(),
      child: Text(
        label,
        style: TextStyle(
          color: ColorData.primary,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: ColorData.surface,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: ColorData.primary,
              width: 2,
            )),
        fixedSize: Size(
          width * 0.4,
          height * 0.075,
        ),
      ),
    );
  }
}
