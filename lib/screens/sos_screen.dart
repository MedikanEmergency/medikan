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
    Location location = new Location();

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
    // GeoCode geoCode = GeoCode();
    // var address = await geoCode.reverseGeocoding(
    //     latitude: _locationData.latitude!, longitude: _locationData.longitude!);
    // setState(() {
    //   yourAddress =
    //       "${address.streetNumber}, ${address.streetAddress}, ${address.city}";
    // });
  }

//GEOLOCATOR
  // getAddr() async {
  //   Position position = await _getGeoLocationPosition();
  //   GetAddressFromLatLong(position);
  // }

  // Future<Position> _getGeoLocationPosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     //DENIED
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   //GRANTED
  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }

  // Future<void> GetAddressFromLatLong(Position position) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(placemarks);
  //   Placemark place = placemarks[0];
  //   Address =
  //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(() {});
  // }

  String yourAddress = 'Vị trí chưa xác định';
  List<String> addresses = []; //["0987654321", "0987654322", "0987654323"]
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
      ),
    );
  }
}
