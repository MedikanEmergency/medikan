import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UpImg {
  Future<String> uploadImage(firebasePath) async {
    //Check permission
    final _picker = ImagePicker();
    final _storage = FirebaseStorage.instance;
    // image;
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //select
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      var file = File(image!.path);
      if (image != null) {
//Upload
        var snapshot = await _storage
            .ref()
            .child(firebasePath + image.name)
            .putFile(file)
            .whenComplete(() => null);

        var downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print('Cancel picking!');
      }
    } else {
      print('Grant Permissions and try again');
    }
    //select img

    //Upload
    return "";
  }
}
