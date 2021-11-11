import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/screens/News_screen/DownLoadContainer.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/News_screen/data.dart';
class DownloadPage extends StatelessWidget {
  Widget buildDownloadContainers() {
    List<Widget> downLoadContainers = [];
    for (Article article in Download) {
      downLoadContainers.add(DownloadContainer(
        article: article,
      ));
    }

    return Column(
      children: downLoadContainers,
    );
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text('Download',style: FontStyleData.H1_bold_36,),
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
              'Danh sách download',
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
          buildDownloadContainers(),
        ],
        ),
      );
}