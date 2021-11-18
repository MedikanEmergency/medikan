// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/input-components/input_name.dart';
import 'package:medikan/components/input-components/input_phone.dart';
import 'package:medikan/models/auth_info.dart';
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
  String img_link =
      "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";
  TextEditingController _name = TextEditingController(),
      _phone = TextEditingController(),
      _img = TextEditingController();
  FirebaseFirestore user = Get.find<FirebaseFirestore>();
  FirebaseAuth account = Get.find<FirebaseAuth>();
  AuthInfo thisUser = Get.find<AuthInfo>();

  String _chosenValue = 'Cha/mẹ';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var isNameError = false;
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
            ),
          ),
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
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: InputName(
                      nameController: _name,
                      isNameError: isNameError,
                      removeNameWarning: () {
                        isNameError = !isNameError;
                      },
                      errorMsg: "Họ và tên sai cú pháp",
                    )),

                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: InputPhone(
                      phoneController: _phone,
                      isPhoneError: false,
                      removeWarning: () {
                        isNameError = !isNameError;
                      },
                      errorMessage: "Hãy kiểm tra số điện thoại",
                    )),
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
                      _chosenValue = value!;
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
                        user
                            .collection('account/' +
                                account.currentUser!.uid +
                                '/family_member')
                            .add({
                          "name": _name.text,
                          "phone": _phone.text,
                          "img": img_link,
                          "relation": _chosenValue,
                        });
                        Navigator.of(context).pop();
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
