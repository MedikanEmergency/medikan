import 'package:flutter/material.dart';
import 'package:medikan/components/input-components/input_name.dart';
import 'package:medikan/models/model_person.dart';
import 'package:flutter/cupertino.dart';
import 'package:medikan/themes/input_theme.dart';
import 'package:medikan/screens/Profile/medical_data.dart';
import 'package:medikan/themes/theme_data.dart';
import '../../models/model_person.dart';

class IllWidget extends StatefulWidget {
  IllModel? selected;
  bool edit = false;

  IllWidget({Key? key, this.selected, required this.edit}) : super(key: key);

  @override
  IllState createState() => IllState();
}

class IllState extends State<IllWidget> {
  TextEditingController except = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: width,
        padding: EdgeInsets.all(5.0),
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
                Container(
                  width: width * 0.6,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: widget.selected!.ill,
                      // icon: const Icon(Icons.down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: !widget.edit
                          ? null
                          : (String? newValue) {
                              setState(() {
                                widget.selected!.ill = newValue!;
                              });
                            },
                      menuMaxHeight: 500,
                      isExpanded: true,
                      // alignment: Alignment.bottomRight,

                      borderRadius: BorderRadius.circular(20),
                      items:
                          disease.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
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
                Container(
                  width: width * 0.6,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      // icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      menuMaxHeight: 200,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(20),

                      value: widget.selected!.level,
                      items: <String>[
                        'Mức nhẹ',
                        'Mức trung bình',
                        'Mức nguy hiểm'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(value),
                          ),
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
