// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medikan/screens/Onboarding/onboarding_screen.dart';
import 'package:medikan/screens/chat%20screen/doctor_screen.dart';
import 'package:medikan/screens/signup_screen.dart';
import 'package:medikan/screens/sos_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/components/sos_components/sos_button.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/chat%20screen/chat_screen.dart';
import 'package:medikan/screens/First_aid/first_aid_screen.dart';
import 'package:medikan/screens/News_screen/news_screen.dart';
import 'package:medikan/screens/personal_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    SafeArea(child: FirstAid()),
    SafeArea(child: DoctorScreen()),
    SafeArea(child: News()),
    SafeArea(child: OnBoarding()),
  ];
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
