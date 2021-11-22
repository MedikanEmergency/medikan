import 'package:flutter/material.dart';
import 'package:medikan/screens/Profile/medical_data.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:flutter/cupertino.dart';

class BloodType extends StatelessWidget {
  String? blood0;
  String? blood1;
  bool edit;
  BloodType({this.blood0, this.blood1, this.edit = false});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
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
            padding: EdgeInsets.only(top: height * .005),
            child: Text(
              "Nhóm máu:",
              style: TextStyle(
                //TODO resize
                fontSize: 12, //18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                value: blood0,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (edit)
                    ? (String? newValue) {
                        blood0 = newValue!;
                      }
                    : null,
                items: bloodName.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: blood1,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (edit)
                    ? (String? newValue) {
                        blood1 = newValue!;
                      }
                    : null,
                items: bloodSign.map<DropdownMenuItem<String>>((String value) {
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
    );
  }
}
