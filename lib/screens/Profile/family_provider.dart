import 'package:medikan/models/auth_info.dart';

import '../../models/model_person.dart';
import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

FirebaseFirestore user = Get.find<FirebaseFirestore>();
FirebaseAuth account = Get.find<FirebaseAuth>();
AuthInfo thisUser = Get.find<AuthInfo>();

class FamilyProviders extends ChangeNotifier {
  //Notes List
  List<MemberModel> member = [
    MemberModel("Võ Văn A", "0395038999", "Cha",
        "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg"),
    MemberModel("Nguyễn Thị B", "0395038999", "Mẹ",
        "https://wallup.net/wp-content/uploads/2017/11/23/438674-duck-yellow.jpg"),
  ];
  List<MemberModel> get getMember {
    return member;
  }

  FamilyProviders() {
    getMem();
  }

  Future<List<MemberModel>> getMem() async {
    await user
        .collection('account/' + account.currentUser!.uid + '/family_member')
        .get()
        .then((value) => {
              value.docs.map((person) => print(person))
              //name:person['name'], phone:person['phone'],relate:person['relation'],pic:person['img']
              //)//.toList() //;
            });
    return member;
  }

// function to add data to list of notes
  void addMember(MemberModel newMember) {
    member.add(newMember);
    notifyListeners();
  }

  bool addMember_(MemberModel newMember) {
    member.add(newMember);
    notifyListeners();

    return true;
  }

  void editMember(MemberModel newMember, int index) {
    member[index] = newMember;
    notifyListeners();
  }

  // function to remove or delete notes by using list index position
  void removeMember(int index) {
    member.removeAt(index);
    notifyListeners();
  }
}
