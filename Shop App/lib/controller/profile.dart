import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var userObj = {}.obs;

  readStoreDetail() {
    _db.collection("settings").doc("store_detail").snapshots().listen((res) {
      (userObj.assignAll({
        "Email": res.data()["Email"],
        "imageURL": res.data()["imageURL"],
        "Store_address": res.data()["Store_address"],
        "Store_name": res.data()["Store_name"],
        "mobile": res.data()["mobile"],
      }));

      /* _Store_nameCtrl.text = res.data()["Store_name"];
      _emailCtrl.text = res.data()["Email"];
      _Store_addressCtrl.text = res.data()["Store_address"];
      _numberCtrl.text = res.data()["mobile"];
      _profileImage = res.data()["imageURL"];*/
    });
  }

  updateStoreDetail(obj) {
    _db
        .collection("settings")
        .doc("store_detail")
        .update(obj)
        .then((value) {})
        .catchError((e) {
      print(e);
    }).then((value) => () {
              Get.back();
            });
  }

  Future uploadProfileImage() async {
    var picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile.path.length != 0) {
      File image = File(pickedFile.path);

      FirebaseStorage _storage = FirebaseStorage.instance;
      _storage
          .ref()
          .child("store")
          .child("storeImage")
          .putFile(image)
          .then((res) {
        print(res);
        res.ref.getDownloadURL().then((url) {
          print("Upload Url" + url);
          _db
              .collection("settings")
              .doc("store_detail")
              .update({
                "imageURL": url,
              })
              .then((value) {})
              .catchError((e) {
                print(e);
              });
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("No file Picked");
    }
  }
}
