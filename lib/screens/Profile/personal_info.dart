import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/screens/Profile/add_family.dart';
import 'package:medikan/components/medical_components/member_widget.dart';
import 'package:medikan/models/model_person.dart';
import 'package:medikan/screens/Profile/medical_info.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/forgot_password.dart';
import 'package:medikan/screens/authenticate_screens/forgot-password/new_password.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'medical_info.dart';
import '../authenticate_screens/login.dart';

class PersonalInfo extends StatefulWidget {
  bool edit;
  PersonalInfo({Key? key, this.edit = false}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  FirebaseFirestore _auth = Get.find<FirebaseFirestore>();
  FirebaseAuth account = Get.find<FirebaseAuth>();
  AuthInfo _state = Get.find<AuthInfo>();

  List<MemberModel> family = [];
  var collectionReference;
  Future<void> _signOut() async {
    await account.signOut();
  }

  @override
  void initState() {
    collectionReference = _auth
        .collection('account/' + account.currentUser!.uid + '/family_member');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final mem=<FamilyProviders>.getMember
    //final mem = Provider.of<FamilyProviders>(context).member;
    // context.watch<Foo>.value;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final user_img = _state.getImg();
    final default_img = "https://cdn-icons-png.flaticon.com/512/168/168726.png";
    // setState(() {});

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        actions: [
          PopupMenuButton(
              icon: Icon(
                MyFlutterApp.setting,
                color: ColorData.onPrimary,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.of(context) //.removeRouteBelow(anchorRoute)
                              .push(
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 700),
                                transitionsBuilder:
                                    (context, animation, animationTime, child) {
                                  animation = CurvedAnimation(
                                      parent: animation, curve: Curves.ease);
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, animationTime) {
                                  return NewPassword(
                                    isForgot: false,
                                    label: "Đổi mật khẩu",
                                  );
                                }),
                            // MaterialPageRoute(
                            //   builder: (context) => LoginScreen())
                          );
                        },
                        child: Text("Đổi mật khẩu"),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          _signOut();
                          // Navigator.of(context).remo(
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginScreen()),
                          //     (MaterialP => false);
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.of(context) //.removeRouteBelow(anchorRoute)
                              .pushReplacement(
                            PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 700),
                                transitionsBuilder:
                                    (context, animation, animationTime, child) {
                                  animation = CurvedAnimation(
                                      parent: animation, curve: Curves.ease);
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, animationTime) {
                                  return LoginScreen();
                                }),
                            // MaterialPageRoute(
                            //   builder: (context) => LoginScreen())
                          );
                        },
                        child: Text("Đăng xuất"),
                      ),
                      value: 2,
                    )
                  ])
        ],
        title: Text(
          "Tài khoản của bạn",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  width: width * .95,
                  height: height * .15,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: ColorData.primaryVariant,
                    shadowColor: Colors.black,
                    elevation: ElevationData.elevated10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: height * .015,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            (user_img != "") ? user_img : default_img,
                          ),
                          radius: height * .06,
                        ),
                        SizedBox(
                          width: height * .015,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _state.getName(),
                              style: TextStyle(
                                  color: ColorData.background,
                                  fontSize: 30,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text(
                              _state.getPhone(),
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorData.background,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // medicalButton(),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 700),
                          transitionsBuilder:
                              (context, animation, animationTime, child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.ease);
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return MedicalInfo();
                          }),
                      //MaterialPageRoute(builder: (context) => MedicalInfo())
                    );
                    setState(() {});
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // width: width * 0.3,
                      padding: EdgeInsets.only(right: width * .02),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: width * .01),
                              child: Text("Xem hồ sơ"),
                            ),
                            Container(
                              child: Icon(
                                MyFlutterApp.goto,
                              ),
                            ),
                          ]),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Danh sách người thân",
                    textAlign: TextAlign.left,
                    style: FontStyleData.Title_Bold_20,
                  ),
                ),
              ),
              StreamBuilder(
                stream: collectionReference.snapshots(),
                builder: (ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting)
                    return Text("Waitting");
                  var document = snapShot.data!.docs;
                  return Column(
                    children: document
                        .map((e) => MemberWidget(
                            mem: MemberModel(
                                e['name'], e['phone'], e['relation'], e['img']),
                            id: e.id))
                        .toList(),
                  );
                },
              ),

              ElevatedButton.icon(
                label: Text(
                  "Thêm người thân",
                  style: FontStyleData.Title_Bold_20,
                ),
                onPressed: () => {
                  //do something
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 700),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.ease);
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return Family();
                        }),
                    //MaterialPageRoute(builder: (context) => Family())
                  )
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24.0,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
