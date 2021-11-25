import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medikan/components/img_component/add_img_component.dart';
import 'package:medikan/components/input-components/input_medical.dart';
import 'package:medikan/components/medical_components/blood_type_component.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/model_person.dart';
import 'package:medikan/screens/Profile/medical_data.dart';
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
  FirebaseAuth _auth = Get.find<FirebaseAuth>();
  FirebaseFirestore _store = Get.find<FirebaseFirestore>();
  final AuthInfo _state = Get.find<AuthInfo>();
  UpImg caller = UpImg();
  final default_img = "https://cdn-icons-png.flaticon.com/512/3011/3011270.png";
  var collectionReference;

  @override
  void initState() {
    initData();
  }

  void initData() async {
    setState(() {
      user_img = _state.getImg();
      path = 'account/' + _auth.currentUser!.uid + '/medical-info';
    });
    List<TextEditingController> _medical = [];
    collectionReference =
        await _store.collection(path).doc('med').get().then((value) {
      _medical.add(TextEditingController(text: value.data()!['height']));
      _medical.add(TextEditingController(text: value.data()!['weight']));
      _medical.add(TextEditingController(text: value.data()!['blood_pr']));
      _medical.add(TextEditingController(text: value.data()!['heartbeat']));
      _medical.add(TextEditingController());
      _medical.add(TextEditingController(text: value.data()!['med_his']));
      setBlood(value.data()!['blood_type'].toString());
      setState(() {
        _medicalController = _medical;
      });
    });
    collectionReference =
        await _store.collection(path + '/med/disease').get().then((value) {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () => () {
                  confirmUpdate();
                  toggleEditButton();
                },
                child: Text("Xác nhận"),
                style: ElevatedButton.styleFrom(
                  primary: ColorData.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => () {
                  // toggleEdit(;
                  setState(() {
                    widget.edit = false;
                  });
                  initData();
                },
                child: Text(
                  "Hủy",
                  style: TextStyle(color: ColorData.primary),
                ),
                style: ElevatedButton.styleFrom(
                  primary: ColorData.surface,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: ColorData.primary,
                        width: 2,
                      )),
                ),
              ),
            ],
          )
        : TextButton.icon(
            onPressed: toggleEditButton,
            icon: Icon(
              Icons.delete,
              color: Colors.black,
              size: 36.0,
            ),
            label: Text("Chỉnh sửa thông tin"));
  }

  addIllButton() {
    return (widget.edit)
        ? TextButton(
            onPressed: () {
              //TODO add firebase
              userIll
                  .add(IllModel("Khác", "Mức nhẹ", userIll.length.toString()));
              setState(() {});
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                Text("Thêm một bệnh nền"),
              ],
            ),
          )
        : Text("");
  }

  List<TextEditingController> _medicalController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  late String path;
  String user_img = "";
  String? dropdownValue, dropValue;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    const defaultImg =
        "https://cdn-icons-png.flaticon.com/512/3011/3011270.png";

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
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 70.0,
                              backgroundImage: NetworkImage(
                                (user_img != "") ? user_img : defaultImg,
                              ),
                            ),
                            Positioned(
                              child: widget.edit
                                  ? IconButton(
                                      splashRadius: 10,
                                      onPressed: () => {
                                            caller
                                                .uploadImage('/user')
                                                .then((value) => {
                                                      if (value != "")
                                                        setState(() {
                                                          user_img = value;
                                                        })
                                                    })
                                          },
                                      icon: Icon(Icons.change_circle_outlined),
                                      color: Colors.red)
                                  : Container(),
                              bottom: -7,
                              right: -7,
                            )
                          ],
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      children: userIll
                          .map(
                            (e) => Slidable(
                              key: Key(e.id!),
                              endActionPane: (widget.edit)
                                  ? ActionPane(
                                      motion: const ScrollMotion(),
                                      extentRatio: 0.25,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              userIll.remove(e);
                                              setState(() {});
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
              addIllButton(),
              toggleEdit(),
            ],
          ),
        ),
      ),
    );
  }

  setBlood(blood) {
    var sign = (blood.length == 3) ? 2 : 1;
    setState(() {
      dropValue = blood[sign];
      dropdownValue = blood[0] + ((sign == 2) ? blood[1] : "");
    });
  }

  confirmUpdate() {
    _store
        .doc('account/' + _auth.currentUser!.uid)
        .set({"img": user_img}, SetOptions(merge: true));
    _state.setImg(user_img);
    updateProfile();
    UpdateIll();
  }

  updateProfile() {
    _store.collection(path).doc('med').set({
      "height": _medicalController[0].text,
      "weight": _medicalController[1].text,
      "blood_pr": _medicalController[2].text,
      "heartbeat": _medicalController[3].text,
      "blood_type": dropdownValue! + dropValue!,
      "med_his": _medicalController[5].text,
    }, SetOptions(merge: true));
  }

  UpdateIll() async {
    await _store
        .collection(path + '/med/disease')
        .get()
        .then((value) => value.docs.forEach((element) {
              _store.collection(path + '/med/disease').doc(element.id).delete();
            }));
    userIll.forEach((element) {
      _store
          .doc(path + '/med/disease/' + element.ill!)
          .set({"name": element.ill, "level": element.level});
    });
  }

  toggleEditButton() {
    setState(() {
      widget.edit = !widget.edit;
    });
  }
}
