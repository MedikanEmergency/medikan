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
      child: Center(child: Text(target)),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorData.secondary,
      ),
    );
  }
}
