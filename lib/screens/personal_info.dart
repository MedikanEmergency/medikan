import 'package:flutter/material.dart';
import 'package:medikan/screens/Profile/add_family.dart';
import 'package:medikan/screens/Profile/member_widget.dart';
import 'package:medikan/screens/Profile/model_person.dart';
import 'package:medikan/screens/medical_info.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:provider/provider.dart';
import './medical_info.dart';
import 'Profile/family_provider.dart';
import 'authenticate_screens/login.dart';

class PersonalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //MultiProvider(providers: [
        ChangeNotifierProvider<FamilyProviders>(
      create: (_) {
        return FamilyProviders();
      },
      child: PersonalInfo(),
    );
  }
}

class PersonalInfo extends StatefulWidget {
  bool edit;
  PersonalInfo({Key? key, this.edit = false}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  // List<MemberModel>? mem;

  @override
  Widget build(BuildContext context) {
    //final mem=<FamilyProviders>.getMember
    //final mem = Provider.of<FamilyProviders>(context).member;
    // context.watch<Foo>.value;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final user_img =
        "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg";
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
                        onPressed: () {},
                        child: Text("Đổi mật khẩu"),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
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
                            user_img,
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
                              "Võ Hồng Phúc",
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
                              "0919813176",
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MedicalScreen()));
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
              Consumer<FamilyProviders>(
                builder: (context, FamilyProviders data, child) {
                  final mem = data.getMember;
                  return Column(
                      children: mem
                          .map((e) =>
                              MemberWidget(mem: e, index: mem.indexOf(e)))
                          .toList());
                },
              ),
              ElevatedButton.icon(
                label: Text(
                  "Thêm người thân",
                  style: FontStyleData.Title_Bold_20,
                ),
                onPressed: () => {
                  //do something
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddFamilyScreen()))
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24.0,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
