import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medikan/components/input-components/input_medical.dart';
import 'package:medikan/components/input-components/input_phone.dart';
import 'package:medikan/components/medical_components/blood_type_component.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/model_person.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:flutter/cupertino.dart';
import '../../models/model_person.dart';
import '../../components/medical_components/ill_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medikan/models/auth_info.dart';

class MedicalInfo extends StatefulWidget {
  bool edit;
  MedicalInfo({Key? key, this.edit = false}) : super(key: key);

  @override
  _MedicalInfoState createState() => _MedicalInfoState();
}

class _MedicalInfoState extends State<MedicalInfo> {
  List<IllModel> userIll = [];
  final user_img =
      "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";

  FirebaseAuth _auth = Get.find<FirebaseAuth>();
  FirebaseFirestore _store = Get.find<FirebaseFirestore>();
  AuthInfo _state = Get.find<AuthInfo>();
  var collectionReference;

  @override
  void initState() {
    initData();
  }

  void initData() async {
    List<TextEditingController> _medical = [];
    collectionReference = await _store
        .collection('account/' + _auth.currentUser!.uid + '/medical-info')
        .doc('med')
        .get()
        .then((value) {
      _medical.add(TextEditingController(text: value.data()!['height']));
      _medical.add(TextEditingController(text: value.data()!['weight']));
      _medical.add(TextEditingController(text: value.data()!['blood_pr']));
      _medical.add(TextEditingController(text: value.data()!['heartbeat']));
      _medical.add(TextEditingController());
      _medical.add(TextEditingController(text: value.data()!['med_his']));
      setState(() {
        _medicalController = _medical;
      });
    });
    collectionReference = await _store
        .collection(
            'account/' + _auth.currentUser!.uid + '/medical-info/med/disease')
        .get()
        .then((value) {
      setState(() {
        userIll = value.docs
            .map((e) => IllModel(e['name'], e['level'], e.id))
            .toList();
      });
    });
  }

  toggleEdit() {
    return (widget.edit)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _store
                      .collection(
                          'account/' + _auth.currentUser!.uid + '/medical-info')
                      .doc('med')
                      .set({
                    "height": _medicalController[0].text,
                    "weight": _medicalController[1].text,
                    "blood_pr": _medicalController[2].text,
                    "heartbeat": _medicalController[3].text,
                    "blood_type": dropdownValue + dropValue,
                    "med_his": _medicalController[5].text,
                  }, SetOptions(merge: true));
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

  refresh() {
    setState(() {});
  }

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
                          _state.getName(),
                          style: FontStyleData.H3_bold_36,
                        ),
                        Text(_state.getPhone(),
                            style: FontStyleData.Subtitle_light_24),
                      ]),
                    ),
                  ),
                ],
              ),
              GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10.0,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  childAspectRatio: (MediaQuery.of(context).size.width * 0.9) /
                      (MediaQuery.of(context).size.height * 0.9 / 4), //TODO 5
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
                              : BloodType(
                                  blood0: dropdownValue,
                                  blood1: dropValue,
                                  edit: widget.edit,
                                ))
                      .toList()),
              Row(
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
                      children: userIll
                          .map(
                            (e) => Slidable(
                              key: Key(e.ill + e.level),
                              endActionPane: (widget.edit)
                                  ? ActionPane(
                                      motion: const ScrollMotion(),
                                      extentRatio: 0.25,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              _store
                                                  .collection('account/' +
                                                      _auth.currentUser!.uid +
                                                      '/medical-info/med/disease')
                                                  .doc(e.id)
                                                  .delete();
                                              refresh();
                                            },
                                            icon: Icon(Icons.delete)),
                                      ],
                                    )
                                  : null,
                              child: IllWidget(selected: e, edit: widget.edit),
                            ),
                          )
                          .toList()),
                ],
              ),
              (widget.edit)
                  ? TextButton(
                      onPressed: () {
                        //TODO add firebase
                        _store
                            .collection('account/' +
                                _auth.currentUser!.uid +
                                '/medical-info/med/disease')
                            .add({"name": "Khác", "level": "Mức nhẹ"});
                        setState(() {
                          userIll.add(IllModel("Khác", "Mức nhẹ", "KHAC!"));
                        });
                        refresh();
                      },
                      child: Text("Thêm một bệnh nền"),
                    )
                  : Text(""),
              toggleEdit(),
            ],
          ),
        ),
      ),
    );
  }
}
