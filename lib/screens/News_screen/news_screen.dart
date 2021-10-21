import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/components/sos_button.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/News_screen/data.dart';
import 'package:medikan/screens/News_screen/ForYouContainer.dart';
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
            onPressed: () {},
            icon: const Icon(
              MyFlutterApp.list,
              color: ColorData.onPrimary,
            ),
          )
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
                color: Colors.black,
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
