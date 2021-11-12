import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import './personal_info.dart';

class ListState {
  String ill;
  String level;
  ListState(this.ill, this.level);
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final user_img =
        "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";
    List<ListState> user_ill = [
      ListState("Huyết áp", "Mức nhẹ"),
      ListState("Huyết áp", "Mức nhẹ")
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //TODO: hốt của thương
            Container(
              alignment: Alignment.topLeft,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonalInfo()));
                  },
                  icon: Icon(Icons.reset_tv_rounded),
                  label: Text("Quay về")),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(children: [
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
              ),
            ),

            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.add_alert_outlined,
                    color: ColorData.sos,
                    size: 36,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                          children: user_ill
                              .map((e) => Ill(
                                  selectedIll: e.ill,
                                  selectedLevel: e.level,
                                  edit: widget.edit))
                              .toList())),
                ),
              ],
            ),

            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: [
                Container(
                  child: Column(
                    children: [
                      Text("Chiều cao: (m)"),
                      TextFormField(
                          decoration: InputDecoration(
                        enabled: true,
                      ))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text("Chiều cao: (m)"),
                      TextFormField(
                          decoration: InputDecoration(
                        enabled: true,
                        suffixText: "1m56",
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Ill extends StatefulWidget {
  String? selectedIll;
  String? selectedLevel;
  bool edit = false;

  Ill({Key? key, this.selectedIll, this.selectedLevel, required this.edit})
      : super(key: key);

  @override
  IllState createState() => IllState();
}

class IllState extends State<Ill> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            // boxShadow: ,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Tên bệnh lý:"),
                  Align(
                    alignment: Alignment.centerRight,
                    child: DropdownButton<String>(
                      value: widget.selectedIll,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: !widget.edit
                          ? null
                          : (String? newValue) {
                              setState(() {
                                widget.selectedIll = newValue!;
                              });
                            },
                      items: <String>[
                        'Béo phì',
                        'Huyết áp',
                        'Tiểu đường',
                        'Tim mạch'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Tình trạng:"),
                  DropdownButton<String>(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    value: widget.selectedLevel,
                    items: <String>[
                      'Mức nhẹ',
                      'Mức trung bình',
                      'Mức nguy hiểm'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: !widget.edit
                        ? null
                        : (String? newValue) {
                            setState(() {
                              widget.selectedLevel = newValue!;
                            });
                          },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
