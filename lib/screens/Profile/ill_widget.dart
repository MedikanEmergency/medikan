import 'package:flutter/material.dart';
import 'package:medikan/screens/Profile/model_person.dart';
import 'package:flutter/cupertino.dart';
import 'package:medikan/themes/theme_data.dart';
import 'model_person.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class IllWidget extends StatefulWidget {
  IllModel? selected;
  bool edit = false;

  IllWidget({Key? key, this.selected, required this.edit}) : super(key: key);

  @override
  IllState createState() => IllState();
}

class IllState extends State<IllWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
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
                Text(
                  "Tên bệnh lý:",
                  style: FontStyleData.Paragraph_Regular_20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton<String>(
                    value: widget.selected!.ill,
                    // icon: const Icon(Icons.down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: !widget.edit
                        ? null
                        : (String? newValue) {
                            setState(() {
                              widget.selected!.ill = newValue!;
                            });
                          },
                    items: <String>[
                      'Béo phì',
                      'Huyết áp',
                      'Tiểu đường',
                      'Tim mạch',
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
                Text(
                  "Tình trạng:",
                  style: FontStyleData.Paragraph_Regular_20,
                ),
                DropdownButton<String>(
                  // icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),

                  value: widget.selected!.level,
                  items: <String>['Mức nhẹ', 'Mức trung bình', 'Mức nguy hiểm']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: !widget.edit
                      ? null
                      : (String? newValue) {
                          setState(() {
                            widget.selected!.level = newValue!;
                          });
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
