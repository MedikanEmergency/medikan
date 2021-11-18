import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medikan/screens/Profile/model_person.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'Profile/model_person.dart';
import 'Profile/ill_widget.dart';
import 'Profile/ill_provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medikan/models/auth_info.dart';

class MedicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IllProviders>(
      create: (_) {
        return IllProviders();
      },
      child: MedicalInfo(),
    );
  }
}

class MedicalInfo extends StatefulWidget {
  bool edit;
  MedicalInfo({Key? key, this.edit = false}) : super(key: key);

  @override
  _MedicalInfoState createState() => _MedicalInfoState();
}

class _MedicalInfoState extends State<MedicalInfo> {
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  List<IllModel> userIll = [
    IllModel("Huyết áp", "Mức nhẹ"),
    IllModel("Huyết áp", "Mức nhẹ")
  ];
  final user_img =
      "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";
  toCard() {
    return userIll
        .map((e) => IllWidget(selected: e, edit: widget.edit))
        .toList();
  }

  FirebaseAuth _auth = Get.find<FirebaseAuth>();
  FirebaseFirestore _store = Get.find<FirebaseFirestore>();
  AuthInfo _state = Get.find<AuthInfo>();
  var collectionReference;
  @override
  void initState() {
    collectionReference = _store
        .collection('account/' + _auth.currentUser!.uid + '/medical-info');

    StreamBuilder(
      stream: collectionReference.snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting)
          return Text("Waitting");
        var document = snapShot.data!.docs;
        return Text("");
      },
    );
    super.initState();
  }

  toggleEdit() {
    return (widget.edit)
        ? Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.edit = !widget.edit;
                  });
                },
                child: Text("Xác nhận"),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      widget.edit = !widget.edit;
                    });
                  },
                  child: Text("Hủy")),
            ],
          )
        : TextButton.icon(
            onPressed: () {
              setState(() {
                widget.edit = !widget.edit;
              });
            },
            icon: Icon(
              Icons.delete,
              color: Colors.black,
              size: 36.0,
            ),
            label: Text("Chỉnh sửa thông tin"));
  }

  refresh() {
    setState(() {});
  }

  String dropdownValue = "AB";
  String dropValue = "+";
  List<int> idx = [0, 1, 2, 3, 4, 5];
  List<String> value = ["", "", "", "", "", ""];
  List<String> header = [
    "Chiều cao (m)",
    "Cân nặng (kg)",
    "Huyết áp (mmHg)",
    "Nhịp tim",
    "",
    "Tiền sử dị ứng"
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Column(children: [
                    Align(
                      heightFactor: 3,
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => PersonalScreen()));
                        },
                        icon: Icon(Icons.reset_tv_rounded),
                        label: Text("Quay về"),
                      ),
                    ),
                  ]),
                  Column(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        user_img,
                      ),
                      radius: 50.0,
                    ),
                    Text(
                      "Võ Hồng Phúc",
                      style: FontStyleData.H3_bold_36,
                    ),
                    Text("0919813156", style: FontStyleData.Subtitle_light_24),
                  ]),
                  //Expanded(flex: 2, child: Container()),
                ],
              ),
              GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10.0,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  childAspectRatio: (MediaQuery.of(context).size.width * 0.9) /
                      (MediaQuery.of(context).size.height * 0.9 / 4), //4
                  shrinkWrap: true,
                  children: idx
                      .map((index) => (index != 4)
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    header[index],
                                    style: FontStyleData.Paragraph_Regular_20,
                                    textAlign: TextAlign.left,
                                  ),
                                  TextField(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      enabled: widget.edit,
                                      onChanged: (newvalue) => setState(() {
                                            value[index] = newvalue;
                                          }))
                                ],
                              ))
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Nhóm máu:",
                                    style: FontStyleData.Paragraph_Regular_20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DropdownButton<String>(
                                        value: dropdownValue,
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (widget.edit)
                                            ? (String? newValue) {
                                                setState(() {
                                                  dropdownValue = newValue!;
                                                });
                                              }
                                            : null,
                                        items: <String>['A', 'B', 'AB', 'O']
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                      DropdownButton<String>(
                                        value: dropValue,
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (widget.edit)
                                            ? (String? newValue) {
                                                setState(() {
                                                  dropValue = newValue!;
                                                });
                                              }
                                            : null,
                                        items: <String>['+', '-', ' ']
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))
                      .toList()),
              Consumer<IllProviders>(
                builder: (context, IllProviders data, child) {
                  return Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Icon(
                            Icons.add_alert_outlined,
                            color: ColorData.sos,
                            size: 36,
                          ),
                        ),
                      ),
                      Column(
                          children: Provider.of<IllProviders>(context)
                              .userIll
                              .map(
                                (e) => Slidable(
                                  key: Key(userIll.indexOf(e).toString()),
                                  endActionPane: (widget.edit)
                                      ? ActionPane(
                                          motion: const ScrollMotion(),
                                          extentRatio: 0.25,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  data.removeIll(
                                                      userIll.indexOf(e));
                                                  refresh();
                                                },
                                                icon: Icon(Icons.delete)),
                                          ],
                                        )
                                      : null,
                                  child:
                                      IllWidget(selected: e, edit: widget.edit),
                                ),
                              )
                              .toList()),
                    ],
                  );
                },
              ),
              Consumer<IllProviders>(
                  builder: (context, IllProviders data, child) {
                return (widget.edit)
                    ? TextButton(
                        onPressed: () {
                          data.addIll("Huyết áp", "Mức nhẹ");
                          refresh();
                        },
                        child: Text("Thêm một bệnh nền"),
                      )
                    : Text("");
              }),
              toggleEdit(),
            ],
          ),
        ),
      ),
    );
  }
}
