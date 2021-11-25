import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/News_screen/data.dart';
import 'package:medikan/screens/News_screen/ForYouContainer.dart';
import 'package:medikan/screens/News_screen/viewlater_screen.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);
  Widget buildForYouContainers() {
    List<Widget> forYouContainers = [];
    for (Article article in forYou) {
      forYouContainers.add(ForYouContainer(
        article: article,
      ));
    }

    return Column(
      children: forYouContainers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 700),
                  transitionsBuilder:
                      (context, animation, animationTime, child) {
                    animation =
                        CurvedAnimation(parent: animation, curve: Curves.ease);
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return ViewlaterPage();
                  }),
              // MaterialPageRoute(
              //   builder: (context) => ViewlaterPage(),
              // ),
            ),
            icon: Icon(
              MyFlutterApp.clock,
              color: ColorData.onPrimary,
            ),
          ),
        ],
        title: Text(
          "Mẹo và tin tức",
          style: FontStyleData.H1_bold_36,
        ),
        backgroundColor: ColorData.secondary,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Dành cho bạn',
              style: TextStyle(
                color: ColorData.onPrimary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildForYouContainers(),
        ],
      ),
    );
  }
}
