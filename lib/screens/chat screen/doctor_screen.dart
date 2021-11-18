import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medikan/components/chat-components/message_tile.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/auth_info.dart';
import 'package:medikan/themes/theme_data.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  FirebaseAuth _auth = Get.find<FirebaseAuth>();
  FirebaseFirestore _store = Get.find<FirebaseFirestore>();
  AuthInfo _state = Get.find<AuthInfo>();
  List<MessageTile> tiles = [];
  var collectionReference;
  void readMessage(String id) {
    _store.collection('conversations').doc(id).set(
      {'is_read': true},
      SetOptions(merge: true),
    );
    setState(() {});
  }

  @override
  void initState() {
    collectionReference =
        _store.collection('conversations').orderBy('latest_message_time');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorData.secondary,
          title: Text(
            "Nhắn tin",
            style: FontStyleData.H1_bold_36,
          ),
        ),
        body: StreamBuilder(
          stream: collectionReference.snapshots(),
          builder: (ctx, AsyncSnapshot<QuerySnapshot> snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting)
              return Text("Waitting");
            var document = snapShot.data!.docs;
            List<Widget> tiles = [];
            for (var e in document) {
              if (e['latest_message'] == "") continue;
              tiles.add(
                MessageTile(
                  id: e['id'],
                  name: e['name'],
                  message: e['latest_message'],
                  isRead: e['is_read'],
                  readMessage: readMessage,
                ),
              );
            }
            return ListView(
              children: tiles,
            );
          },
        )
        // body: Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: ListView(
        //     children: [
        //       MessageTile(
        //         id: 0,
        //         name: "hoang",
        //         message: "Làm sao có thể chữa được tất cả các bệnh UwUsfewiofwe",
        //         isRead: isRead[0],
        //         readMessage: readMessage,
        //       ),
        //       MessageTile(
        //         id: 1,
        //         name: "hoang",
        //         message: "Làm sao có thể chữa được tất cả các bệnh UwUsfewiofwe",
        //         isRead: isRead[1],
        //         readMessage: readMessage,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
