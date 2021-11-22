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
  final _userState = Get.find<AuthInfo>();
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

  @override
  void initState() {
    checkChatTime();
    _pages = [
      SafeArea(child: FirstAid()),
      SafeArea(child: _userState.getDoctor() ? DoctorScreen() : Chat()),
      SafeArea(child: News()),
      SafeArea(child: PersonalInfo()),
    ];
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
      floatingActionButton: SOS(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorData.onPrimary),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.medical_kit),
              label: "Sơ cấp cứu",
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.social_distancing),
              label: "Hỏi bác sĩ",
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.medical_file),
              label: "Mẹo và tin tức",
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.nurse),
              label: "Tài khoản",
            ),
          ],
          unselectedItemColor: ColorData.inactive.withOpacity(0.5),
          selectedItemColor: ColorData.primary,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedPage,
          onTap: _onTapPage,
        ),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        controller: _pageController,
      ),
    );
  }
}
