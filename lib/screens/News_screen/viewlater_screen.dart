import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/screens/News_screen/ViewLaterContainer.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/News_screen/data.dart';

class ViewlaterPage extends StatelessWidget {
  Widget buildViewLaterContainers() {
    List<Widget> viewLaterContainers = [];
    for (Article article in ViewLater) {
      viewLaterContainers.add(ViewlaterContainer(
        article: article,
      ));
    }

    return Column(
      children: viewLaterContainers,
    );
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text('Xem sau',style: FontStyleData.H1_bold_36,),
          centerTitle: true,
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
              'Danh sách xem sau',
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
          buildViewLaterContainers(),
        ],
        ),
      );
}