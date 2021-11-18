// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:medikan/screens/Profile/family_provider.dart';
import 'package:medikan/screens/Profile/model_person.dart';
import 'package:medikan/screens/personal_info.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:provider/provider.dart';

class AddFamilyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FamilyProviders>(
      create: (_) {
        return FamilyProviders();
      },
      child: Family(),
    );
  }
}

class Family extends StatefulWidget {
  Family({Key? key}) : super(key: key);

  @override
  _FamilyState createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  String? _chosenValue = "Khác";
  String _name = "hgjhj",
      _phone = "fdgf",
      _img =
          "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";
  // TextEditingController nameController, phoneController;

// File _image;

// Future cameraImage() async {
//   var image = await ImagePicker.pickImage(
//     source: ImageSource.camera,
//     maxHeight: 240.0,
//     maxWidth: 240.0,
//   );

//   setState(() {
//     _image = image;
//   });
// }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyFlutterApp.setting,
                color: ColorData.onPrimary,
              ))
          //TODO sublist for icon
        ],
        title: Text(
          "Thêm người thân",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Họ và tên",
                      style: FontStyleData.Title_Bold_20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: TextFormField(
                    // controller: nameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Số điện thoại",
                      style: FontStyleData.Title_Bold_20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: TextFormField(
                      // controller: phoneController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '10 chữ số',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                      ),
                      style: FontStyleData.Subtitle_light_24.apply(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF14181B),
                        // fontSize: 14,
                        // fontWeightDelta:FontWeight.normal,
                      )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mối liên hệ",
                      style: FontStyleData.Title_Bold_20,
                    ),
                  ),
                ),
                // _buildPanel(),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    isExpanded: true,
                    value: _chosenValue, // this is the magic
                    items: <String>[
                      'Ông/bà',
                      'Cha/mẹ',
                      'Vợ/chồng',
                      'Anh/Chị',
                      'Con/Cháu',
                      'Họ hàng',
                      'Khác'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _chosenValue = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ảnh đại diện",
                      style: FontStyleData.Title_Bold_20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        child: Image.network(
                          "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                          fit: BoxFit.fill,
                          width: width * 0.4,
                          height: width * 0.4,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const IconButton(
                          icon: Icon(
                            // passwordLoginVisibility
                            //     ? Icons.visibility_outlined
                            //     :
                            Icons.upload_rounded,
                            color: Color(0xFF95A1AC),
                            size: 20,
                          ),
                          onPressed: null,
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                Consumer<FamilyProviders>(
                  builder: (context, FamilyProviders data, child) {
                    return TextButton(
                      onPressed: () {
                        data.addMember(
                            MemberModel("name", "phone", "relate", "pic")
                            //MemberModel(_name, _phone, _chosenValue!, _img)
                            );
                        print(data.getMember);
                        Navigator.of(context).pop();
                        // print(data.member);
                        // push(MaterialPageRoute(
                        //     builder: (context) => PersonalScreen()));
                      },
                      child: Text("Xác nhận"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
