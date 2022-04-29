import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var product = [].obs;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  onInit() {
    super.onInit();
    fetchProduct();
  }

  fetchProduct() {
    _db.collection("products").snapshots().listen((event) {
      var _tmp = [];
      event.docs.forEach((element) {
        _tmp.add({"id": element.id, ...element.data()});
      });
      product.assignAll(_tmp);
    });
  }

  add(obj) {
    _db
        .collection("products")
        .add(obj)
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
      print(e);
    });
  }

  updateProduct(id, obj) {
    _db
        .collection("products")
        .doc(id)
        .update(obj)
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
      print(e);
    });
  }

  delete(id) {
    _db
        .collection("products")
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
