import 'package:flutter/material.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/models/model_person.dart';
import 'package:flutter/cupertino.dart';
import 'package:medikan/themes/theme_data.dart';
import '../../models/model_person.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MemberWidget extends StatefulWidget {
  MemberModel mem;
  String id;
  MemberWidget({
    Key? key,
    required this.mem,
    required this.id,
  }) : super(key: key);

  @override
  MemberState createState() => MemberState();
}

class MemberState extends State<MemberWidget> {
  FirebaseFirestore user = Get.find<FirebaseFirestore>();
  FirebaseAuth account = Get.find<FirebaseAuth>();
  AuthInfo thisUser = Get.find<AuthInfo>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        // width: MediaQuery.of(context).size.width - 20,
        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                child: Image.network(
                  (widget.mem.pic != "")
                      ? widget.mem.pic
                      : "https://cdn-icons-png.flaticon.com/512/168/168726.png",
                  fit: BoxFit.fill,
                  width: width * 0.18,
                  height: width * 0.18,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.mem.name,
                          style: FontStyleData.Title_Bold_20,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "(" + widget.mem.relate + ")",
                          style: FontStyleData.Mini_Title_Light_16,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                  subtitle: Text(widget.mem.phone,
                      style: FontStyleData.Paragraph_Regular_20),
                ),
              ),
              // flex: 7,
            ),
            IconButton(
                onPressed: () async {
                  await user
                      .collection('account/' +
                          account.currentUser!.uid +
                          '/family_member')
                      .doc(widget.id)
                      .delete();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30.0,
                )),
          ],
        ),
        // elevation: 8,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
