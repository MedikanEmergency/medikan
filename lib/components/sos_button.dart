// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/screens/sos_screen.dart';

class SOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SosScreen()));
      },
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        fixedSize: Size(
          width / 4.5,
          width / 4.5,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 0,
            child: Container(
              width: width / 7,
              height: width / 10,
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
