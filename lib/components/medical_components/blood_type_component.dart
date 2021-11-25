import 'package:flutter/material.dart';
import 'package:medikan/screens/Profile/medical_data.dart';
import 'package:medikan/screens/Profile/medical_info.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:flutter/cupertino.dart';

class BloodType extends StatefulWidget {
  // String blood0;
  // String blood1;
  TextEditingController blood0 = TextEditingController();
  TextEditingController blood1 = TextEditingController();
  bool edit;
  BloodType({required this.blood0, required this.blood1, this.edit = false});
  _BloodTypeState createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Nhóm máu',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorData.onPrimary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton<String>(
            value: widget.blood0.text,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (widget.edit)
                ? (String? newValue) {
                    setState(() {
                      widget.blood0.text = newValue!;
                    });
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
            value: widget.blood1.text,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (widget.edit)
                ? (String? newValue) {
                    setState(() {
                      widget.blood1.text = newValue!;
                    });
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
      ),
    );
  }
}
