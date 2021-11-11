import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medikan/components/sos_countdown.dart';
import 'package:medikan/screens/sos_target.dart';
import 'package:medikan/themes/theme_data.dart';

class SosScreen extends StatefulWidget {
  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  int _second = 10;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _second--;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    Future(
      () {
        if (_second == 0) {
          timer?.cancel();
          // do something to send S.O.S message
        }
      },
    );
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          width: width,
          height: height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SosTarget(
              target: "Bệnh viện",
            ),
            SizedBox(
              width: width * 0.1,
            ),
            SosTarget(
              target: "Người thân",
            ),
          ],
        ),
        SizedBox(
          width: width,
          height: height * 0.15,
        ),
        CountDown(width: width, second: _second, timer: timer, height: height)
      ],
    ));
  }
}
