import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/components/sos_button.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/News_screen/data.dart';
import 'package:medikan/screens/News_screen/ForYouContainer.dart';
import 'package:medikan/screens/News_screen/viewlater_screen.dart';
import 'package:medikan/screens/News_screen/download_screen.dart';
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
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ViewlaterPage()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DownloadPage()),
        );
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.black),
                // textTheme: TextTheme().apply(bodyColor: Colors.black),
              ),
              child:PopupMenuButton<int>(
                color: ColorData.secondary,
                icon: Icon(
                  MyFlutterApp.list,
                  color: ColorData.onPrimary,
                ),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(MyFlutterApp.clock),
                        const SizedBox(width: 8),
                        Text('Xem sau'),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(MyFlutterApp.download_circle_outline),
                        const SizedBox(width: 8),
                        Text('Download'),
                      ],
                    ),
                  ),
                ],
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
