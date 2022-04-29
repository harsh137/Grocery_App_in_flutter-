import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var categories = [].obs;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  var _categories = [];
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  fetchCategories() {
    _db.collection("categories").snapshots().listen((event) {
      var _tmp = [];
      event.docs.forEach((element) {
        _tmp.add({"id": element.id, ...element.data()});
      });
      categories.assignAll(_tmp);
    });
  }

  updateCategory(id, obj) {
    _db
        .collection("categories")
        .doc(id)
        .update(obj)
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
      print(e);
    });
  }

  add(obj) {
    _db
        .collection("categories")
        .add(obj /*"title": _titleCtrl.text,*/)
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
      print(e);
    });
  }

  delete(id) {
    _db
        .collection("categories")
        .doc(id)
        .delete()
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
      print(e);
    });
  }
}
