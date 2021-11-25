// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/screens/chat%20screen/doctor_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/components/sos_components/sos_button.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/chat%20screen/chat_screen.dart';
import 'package:medikan/screens/First_aid/first_aid_screen.dart';
import 'package:medikan/screens/News_screen/news_screen.dart';
import 'package:medikan/screens/Profile/personal_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _userState = Get.find<AuthInfo>();
  final _firestore = Get.find<FirebaseFirestore>();
  final _auth = Get.find<FirebaseAuth>();
  int chatTime = 0;
  int _selectedPage = 0;
  List<Widget> _pages = [];

  void checkChatTime() async {
    await _firestore
        .collection('conversations')
        .doc('${_auth.currentUser!.uid}')
        .get()
        .then(
      (value) {
        chatTime = value.data()!['chat_time'];

        var modified =
            DateTime.parse(value.data()!['modified_time'].toDate().toString());
        bool isOneDayPassed =
            DateTime.now().subtract(Duration(days: 1)).compareTo(modified) >= 0;

        if (chatTime == 0 && isOneDayPassed) {
          _firestore
              .collection('conversations')
              .doc('${_auth.currentUser!.uid}')
              .set({'chat_time': 3}, SetOptions(merge: true));
          chatTime = 3;
        }
        _userState.setChatTime(chatTime);
      },
    );
  }

  void init() async {
    checkChatTime();
    _pages = [
      SafeArea(
        child: FirstAid(),
        bottom: false,
      ),
      SafeArea(
        child: _userState.getDoctor() ? DoctorScreen() : Chat(),
        bottom: false,
      ),
      SafeArea(
        child: News(),
        bottom: false,
      ),
      SafeArea(
        child: PersonalInfo(),
        bottom: false,
      ),
    ];
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  PageController? _pageController = PageController(initialPage: 0);

  void _onTapPage(int index) {
    setState(() {
      _selectedPage = index;
      _pageController?.animateToPage(_selectedPage,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: SOS(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 7.5,
        // color: ColorData.background,
        elevation: 10,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 30.0,
                // padding: EdgeInsets.only(left: 28.0),
                icon: Icon(
                  MyFlutterApp.medical_kit,
                  color: _selectedPage == 0
                      ? ColorData.primary
                      : ColorData.inactive,
                ),
                onPressed: () {
                  setState(() {
                    _pageController!.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                // padding: EdgeInsets.only(right: 28.0),
                icon: Icon(
                  MyFlutterApp.social_distancing,
                  color: _selectedPage == 1
                      ? ColorData.primary
                      : ColorData.inactive,
                ),
                onPressed: () {
                  setState(() {
                    _pageController!.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
              ),
              SizedBox(
                width: 75,
              ),
              IconButton(
                iconSize: 30.0,
                // padding: EdgeInsets.only(left: 28.0),
                icon: Icon(
                  MyFlutterApp.medical_file,
                  color: _selectedPage == 2
                      ? ColorData.primary
                      : ColorData.inactive,
                ),
                onPressed: () {
                  setState(() {
                    _pageController!.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                // padding: EdgeInsets.only(right: 28.0),
                icon: Icon(
                  MyFlutterApp.nurse,
                  color: _selectedPage == 3
                      ? ColorData.primary
                      : ColorData.inactive,
                ),
                onPressed: () {
                  setState(() {
                    _pageController!.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
            print(_selectedPage);
          });
        },
        controller: _pageController,
      ),
    );
  }
}
