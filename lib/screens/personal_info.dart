import 'package:flutter/material.dart';
import 'package:medikan/screens/medical_info.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import './medical_info.dart';

class PersonalInfo extends StatelessWidget {
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState

  //   throw UnimplementedError();
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final user_img =
        "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        actions: [
          PopupMenuButton(
              icon: Icon(
                MyFlutterApp.setting,
                color: ColorData.onPrimary,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("First"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Second"),
                      value: 2,
                    )
                  ])
        ],
        title: Text(
          "Tài khoản của bạn",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                color: ColorData.primary,
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Expanded(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              user_img,
                            ),
                            radius: 50.0,
                          ),
                          flex: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          title: Text(
                            "Võ Hồng Phúc",
                          ),
                          subtitle: Text("0919813176"),
                        ),
                        decoration: BoxDecoration(
                            // boxShadow: BoxShadow,
                            //TODO: đổ bóng
                            ),
                      ),
                      flex: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MedicalInfo()));
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width * 0.3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Xem hồ sơ"),
                        Container(
                          child: Icon(
                            MyFlutterApp.goto,
                          ),
                        ),
                      ]),
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Danh sách người thân",
                textAlign: TextAlign.left,
                style: FontStyleData.Title_Bold_20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipRRect(
                          child: Image.network(
                            user_img,
                            fit: BoxFit.fill,
                            width: width * 0.2,
                            height: width * 0.2,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            title: Text("Võ Văn A (Cha)"),
                            subtitle: Text("0913456123"),
                          ),
                        ),
                        flex: 7,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 36.0,
                          )),
                    ],
                  ),
                ),
              ),
              // elevation: 8,
              margin: EdgeInsets.all(10),
            ),
          ),
          ElevatedButton.icon(
            label: Text(
              "Thêm người thân",
              style: FontStyleData.Title_Bold_20,
            ),
            onPressed: () => {
              //do something
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
