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
                      child: Text("First"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Second"),
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
                  height: 100,
                  decoration: BoxDecoration(
                    color: ColorData.primary,
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              user_img,
                            ),
                            radius: 50.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                            title: Text(
                              "Võ Hồng Phúc",
                            ),
                            subtitle: Text("0919813176"),
                          ),
                          decoration: BoxDecoration(
                              // boxShadow: BoxShadow,
                              //TODO: đổ bóng
                              ),
                        ),
                        flex: 8,
                      ),
                    ],
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Xem hồ sơ"),
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
