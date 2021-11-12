import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class DoneButton extends StatelessWidget {
  final double width;
  final double height;
  final Function func;
  final String label;
  DoneButton(
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
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: ColorData.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: Size(
          width * 0.4,
          height * 0.075,
        ),
      ),
    );
  }
}
