import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:medikan/components/sos_components/sos_countdown.dart';
import 'package:medikan/components/sos_components/sos_target.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:sms_maintained/contact.dart';
import 'package:sms_maintained/generated/i18n.dart';
import 'package:sms_maintained/globals.dart';
import 'package:sms_maintained/sms.dart';

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

  List<String> addresses = ["0987654321", "0987654322", "0987654323"];
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

          SmsSender sender = SmsSender();
          List<SmsMessage> messages = [];
          for (var i = 0; i < addresses.length; i++) {
            messages.add(SmsMessage(addresses[i], 'Hello flutter!'));
            messages[i].onStateChanged.listen((state) {
              if (state == SmsMessageState.Sent) {
                print("SMS is sent!");
              } else if (state == SmsMessageState.Delivered) {
                print("SMS is delivered!");
              }
            });
            sender.sendSms(messages[i]);
          }
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
