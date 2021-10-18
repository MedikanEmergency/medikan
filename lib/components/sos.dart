// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 5,
            left: 20,
            child: Container(
              width: 110.5,
              height: 75,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.red.withOpacity(0.2),
                    Colors.white.withOpacity(0.65)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  borderRadius: BorderRadius.all(Radius.elliptical(110.5, 75))),
            ),
          ),
          Center(
            child: Text(
              "S.O.S",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
