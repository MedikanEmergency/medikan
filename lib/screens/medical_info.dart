

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';

class MedicalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Row(children: [
            ElevatedButton.icon( onPressed: (){},icon: Icon(Icons.reset_tv_rounded), label: Text("Quay về")),
            Expanded(child:Column(
              children: [
                CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                          ),
                          
                          radius: 50.0,
                          
                        ),
                Text("Võ Hồng Phúc"),
                Text("0919813156"),
              ],
            )
            
            )
            ]
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
                    )
                  )
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
                    )
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Cân nặng: (kg)"),
                  TextFormField(
                    decoration: InputDecoration(
                      enabled: true,
                      suffixText: "1m56",
                    )
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Huyết áp: (mmHg)"),
                  TextFormField(
                    decoration: InputDecoration(
                      enabled: true,
                    )
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Nhịp tim"),
                  TextFormField(
                    decoration: InputDecoration(
                      enabled: true,
                    )
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Nhóm máu:"),
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
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
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
      items: <String>['+','-']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
            Container(
              child: Column(
                children: [
                  Text("Tiền sử dị ứng:"),
                  TextFormField(
                    decoration: InputDecoration(
                      enabled: true,
                    )
                  )
                ],
              ),
            ),
                ],
              ),
            ),

          ]
          
          
          ),

        Row(
          children: [
            Icon(Icons.add_alert_outlined),
            Expanded(
              child: 
              Column(
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
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
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
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
                ],
              )
              
              
            ),
          ],

        ) 
        ],

      ),
    );
  }
}

class Item {
  Item(
    {
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;
}

