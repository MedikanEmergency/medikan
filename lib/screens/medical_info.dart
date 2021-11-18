import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medikan/components/input-components/input_medical.dart';
import 'package:medikan/components/input-components/input_phone.dart';
import 'package:medikan/screens/Profile/model_person.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import './personal_info.dart';
import 'Profile/model_person.dart';
import 'Profile/ill_widget.dart';
import 'Profile/ill_provider.dart';

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
  MedicalInfo({Key? key, this.edit = true}) : super(key: key);

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final videosState = Provider.of<IllProviders>(context);
    userIll = videosState.userIll;
  }

  toggleEdit() {
    return (widget.edit)
        ? Column(
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
              //   ],
              // )
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

  // rmv(int index) {
  //   Provider.of<IllProviders>(context).removeIll(index);
  //   setState(() {});
  // }
  refresh() {
    setState(() {});
  }

  // const Blood() {
  //   return ;
  // }

  List<TextEditingController> _medicalController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String dropdownValue = "AB";
  String dropValue = "+";
  List<int> idx = [0, 1, 2, 3, 4, 5];
  List<String> value = ["", "", "", "", "", ""];
  List<String> header = [
    "Chiều cao (cm)",
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
              Stack(
                children: [
                  Align(
                    heightFactor: 3,
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: height * .015),
                      padding: EdgeInsets.only(top: height * .01),
                      child: ElevatedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.only(right: width * .01),
                          child: Icon(
                            MyFlutterApp.return_icon,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                        label: Text(
                          'Quay về',
                          style: TextStyle(
                            color: ColorData.onPrimary,
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          elevation: ElevationData.elevated10,
                          primary: ColorData.secondary,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          )),
                        ),
                      ),
                    ),
                    // child: ElevatedButton.icon(
                    //   onPressed: () {
                    //     Navigator.of(context).pop();
                    //     // Navigator.of(context).push(MaterialPageRoute(
                    //     //     builder: (context) => PersonalScreen()));
                    //   },
                    //   icon: Icon(Icons.reset_tv_rounded),
                    //   label: Text("Quay về"),
                    // ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: Column(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            user_img,
                          ),
                          radius: 70.0,
                        ),
                        Text(
                          "Võ Hồng Phúc",
                          style: FontStyleData.H3_bold_36,
                        ),
                        Text("0919813156",
                            style: FontStyleData.Subtitle_light_24),
                      ]),
                    ),
                  ),
                  //Expanded(flex: 2, child: Container()),
                ],
              ),
              GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10.0,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  childAspectRatio: (MediaQuery.of(context).size.width * 0.9) /
                      (MediaQuery.of(context).size.height * 0.9 / 5), //4
                  shrinkWrap: true,
                  children: idx
                      .map((index) => (index < 4)
                          ? InputMedical(
                              phoneController: _medicalController[index],
                              isPhoneError: false,
                              errorMessage: "",
                              removeWarning: () {},
                              label: header[index],
                              inputType: 'number',
                              enabled: widget.edit,
                            )
                          : (index == 5)
                              ? InputMedical(
                                  phoneController: _medicalController[index],
                                  isPhoneError: false,
                                  errorMessage: "",
                                  removeWarning: () {},
                                  label: header[index],
                                  inputType: 'text',
                                  enabled: widget.edit,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.5,
                                      color: ColorData.onPrimary,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height * .005),
                                        child: Text(
                                          "Nhóm máu:",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                              .map((e) => Slidable(
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
                                  child: IllWidget(
                                      selected: e, edit: widget.edit)))
                              .toList()),
                    ],
                  );
                },
              ),
              toggleEdit(),
            ],
          ),
        ),
      ),
    );
  }
}
