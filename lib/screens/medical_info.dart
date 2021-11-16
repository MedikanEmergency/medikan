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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              PopupMenuItem(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonalInfo()));
                  },
                  icon: Icon(Icons.reset_tv_rounded),
                  label: Text("Quay về"),
                ),
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
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2, crossAxisSpacing: 5.0,
                childAspectRatio: (MediaQuery.of(context).size.width * 0.9) /
                    (MediaQuery.of(context).size.height * 0.9 / 4),

                // mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: [
                  //Text("JASHJHGASJDHGAJSHGHJASD")
                  Container(
                    // width: width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Chiều cao: (m)"),
                        TextFormField(
                          enabled: false,
                          cursorHeight: 2,
                          enableSuggestions: true,
                          maxLines: 1,
                          expands: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Cân nặng: (kg)"),
                        TextFormField(
                          enabled: false,
                          cursorHeight: 2,
                          enableSuggestions: true,
                          maxLines: 1,
                          expands: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Huyết áp: (mmHg)"),
                        TextFormField(
                          enabled: false,
                          cursorHeight: 2,
                          enableSuggestions: true,
                          maxLines: 1,
                          expands: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Huyết áp: (mmHg)"),
                        TextFormField(
                          enabled: false,
                          cursorHeight: 2,
                          enableSuggestions: true,
                          maxLines: 1,
                          expands: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Nhóm máu:"),
                        Row(
                          children: [
                            DropdownButton<String>(
                              // value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                // setState(() {
                                //   dropdownValue = newValue!;
                                // });
                              },
                              items: <String>[
                                'A',
                                'B',
                                'AB',
                                'O'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              // value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                // setState(() {
                                //   dropdownValue = newValue!;
                                // });
                              },
                              items: <String>[
                                '+',
                                '-'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                  ),
                  Container(
                    // width: width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text("Tiền sử dị ứng"),
                        TextFormField(
                          enabled: false,
                          cursorHeight: 2,
                          enableSuggestions: true,
                          maxLines: 2,
                          expands: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Align(
              //       alignment: Alignment.topLeft,
              //       child: Icon(
              //         Icons.add_alert_outlined,
              //         color: ColorData.sos,
              //         size: 36,
              //       ),
              //     ),
              //     Expanded(
              //       // flex: 8,
              //       child: Padding(
              //           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              //           child: Column(
              //               children: user_ill
              //                   .map((e) => Ill(
              //                       selectedIll: e.ill,
              //                       selectedLevel: e.level,
              //                       edit: widget.edit))
              //                   .toList())),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Ill extends StatefulWidget {
//   String? selectedIll;
//   String? selectedLevel;
//   bool edit = false;

//   Ill({Key? key, this.selectedIll, this.selectedLevel, required this.edit})
//       : super(key: key);

//   @override
//   IllState createState() => IllState();
// }

// class IllState extends State<Ill> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Container(
//           decoration: BoxDecoration(
//             // boxShadow: ,
//             border: Border.all(color: Colors.black, width: 2),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text("Tên bệnh lý:"),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: DropdownButton<String>(
//                       value: widget.selectedIll,
//                       icon: const Icon(Icons.arrow_downward),
//                       iconSize: 24,
//                       elevation: 16,
//                       style: const TextStyle(color: Colors.deepPurple),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.deepPurpleAccent,
//                       ),
//                       onChanged: !widget.edit
//                           ? null
//                           : (String? newValue) {
//                               setState(() {
//                                 widget.selectedIll = newValue!;
//                               });
//                             },
//                       items: <String>[
//                         'Béo phì',
//                         'Huyết áp',
//                         'Tiểu đường',
//                         'Tim mạch'
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text("Tình trạng:"),
//                   DropdownButton<String>(
//                     icon: const Icon(Icons.arrow_downward),
//                     iconSize: 24,
//                     elevation: 16,
//                     style: const TextStyle(color: Colors.deepPurple),
//                     underline: Container(
//                       height: 2,
//                       color: Colors.deepPurpleAccent,
//                     ),
//                     value: widget.selectedLevel,
//                     items: <String>[
//                       'Mức nhẹ',
//                       'Mức trung bình',
//                       'Mức nguy hiểm'
//                     ].map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: !widget.edit
//                         ? null
//                         : (String? newValue) {
//                             setState(() {
//                               widget.selectedLevel = newValue!;
//                             });
//                           },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
