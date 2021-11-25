import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';

class SosTarget extends StatelessWidget {
  const SosTarget({
    required this.target,
    Key? key,
  }) : super(key: key);
  final target;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          target,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: ColorData.sos, fontWeight: FontWeight.bold),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorData.secondary,
      ),
    );
  }
}
