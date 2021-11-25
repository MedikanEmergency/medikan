import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:medikan/components/sos_components/sos_countdown.dart';
import 'package:medikan/components/sos_components/sos_target.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:sms_maintained/contact.dart';
import 'package:sms_maintained/generated/i18n.dart';
import 'package:sms_maintained/globals.dart';
import 'package:sms_maintained/sms.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

class SosScreen extends StatefulWidget {
  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  int _second = 10;
  Timer? timer;

  FirebaseFirestore _auth = Get.find<FirebaseFirestore>();
  FirebaseAuth account = Get.find<FirebaseAuth>();
  AuthInfo _state = Get.find<AuthInfo>();
  var path;
  @override
  void initState() {
    // TODO: implement initState
    path = 'account/' + account.currentUser!.uid + '/family_member';
    getFamily();
    getLoc();
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _second--;
      setState(() {});
    });
  }

  getFamily() async {
    await _auth
        .collection(path)
        .get()
        .then((value) => value.docs.forEach((element) {
              var newaddr = addresses;
              newaddr.add(element.data()['phone'].toString());
              setState(() {
                print(newaddr);
                print(addresses);
                addresses = newaddr;
              });
            }));
  }

  getLoc() async {
    // LOCATION
    Location location = Location();

    bool _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    LocationData _locationData;
    _locationData = await location.getLocation();

    setState(() {
      loc = _locationData;
    });
  }

  String yourAddress = 'Vị trí chưa xác định';
  List<String> addresses = [];
  late LocationData loc;
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
          // print(yourAddress);
          print(loc.latitude!);
          print(loc.longitude!);
          print(addresses);
          SmsSender sender = SmsSender();
          for (var i = 0; i < addresses.length; i++) {
            final msg = "Tôi đang gặp nguy hiểm, hãy tới tọa độ " +
                loc.latitude.toString() +
                ", " +
                loc.longitude.toString();

            SmsMessage tmp = SmsMessage(addresses[i], msg);

            tmp.onStateChanged.listen((state) {
              if (state == SmsMessageState.Sent) {
                print("SMS is sent!");
              } else if (state == SmsMessageState.Delivered) {
                print("SMS is delivered!");
              }
            });
            sender.sendSms(tmp);
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
                target: "*Tin nhắn S.O.S sẽ chứa kinh độ và vĩ độ",
              ),
            ],
          ),
          SizedBox(
            width: width,
            height: height * 0.15,
          ),
          CountDown(width: width, second: _second, timer: timer, height: height)
        ],
      ),
    );
  }
}
