import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/controller/categories.dart';
import 'package:store/controller/products.dart';

class ManageProductScreen extends StatefulWidget {
  bool canEdit = false;
  var product = {};
  ManageProductScreen({this.canEdit, this.product}) {}
  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  ProductController _productCtrl = Get.put(ProductController());
  CategoriesController _categoriesCtrl = Get.put(CategoriesController());

  var imageUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  TextEditingController _productNameCtrl = TextEditingController();
  TextEditingController _productPriceCtrl = TextEditingController();
  TextEditingController _productDescriptionCtrl = TextEditingController();

  var _selectedId = "KfXQVDlG8Fg3Qdv8sSIB";

  /* fetchCategories() {
    _db.collection("categories").snapshots().listen((event) {
      var _tmp = [];
      event.docs.forEach((element) {
        _tmp.add({
          "id": element.id,
          "title": element.data()["title"],
        });
      });
      setState(() {
        categories = _tmp;
      });
    });
  }*/

  /*add() {
    _db
        .collection("products")
        .add({
          "title": _productNameCtrl.text,
          "price": double.parse(_productPriceCtrl.text),
          "categoryId": _selectedId,
          "description": _productDescriptionCtrl.text,
          "imageUrl": imageUrl,
        })
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
          print(e);
        });
  }

  update() {
    _db
        .collection("products")
        .doc(widget.product['id'])
        .update({
          "title": _productNameCtrl.text,
          "categoryId": _selectedId,
          "price": double.parse(_productPriceCtrl.text),
          "description": _productDescriptionCtrl.text,
          "imageUrl": imageUrl,
        })
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
          print(e);
        });
  }

  delete() {
    _db
        .collection("products")
        .doc(widget.product['id'])
        .delete()
        .then((value) => {
              Get.back(),
            })
        .catchError((e) {
      print(e);
    });
  }*/

  Future uploadProductImage() async {
    var picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != 0) {
      File image = File(pickedFile.path);
      FirebaseStorage _storage = FirebaseStorage.instance;
      var filePath = (DateTime.now().microsecondsSinceEpoch).toString();
      _storage
          .ref()
          .child("product")
          .child(filePath)
          .putFile(image)
          .then((res) {
        print(res);
        res.ref.getDownloadURL().then((url) {
          print("Upload Url" + url);
          setState(() {
            imageUrl = url;
          });
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("No file Picked");
    }
  }

  @override
  void initState() {
    super.initState();

    _productNameCtrl.text = widget.product["title"];
    _productPriceCtrl.text = widget.product["price"].toString() == null
        ? 20
        : widget.product["price"].toString();
    _productDescriptionCtrl.text = widget.product["description"];
    _selectedId = widget.product["categoryId"] == null
        ? "KfXQVDlG8Fg3Qdv8sSIB"
        : widget.product["categoryId"];
    imageUrl = widget.product["imageUrl"] != null
        ? widget.product["imageUrl"]
        : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("${widget.canEdit ? "Edit" : "Add"} Product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: uploadProductImage,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 60,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _productNameCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Product Title",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _productPriceCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Price",
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories"),
                    Obx(
                      () => DropdownButton(
                        value: _selectedId,
                        onChanged: (v) {
                          setState(() {
                            _selectedId = v;
                          });
                        },
                        items: _categoriesCtrl.categories.map((category) {
                          return DropdownMenuItem(
                            value: category["id"],
                            child: Text(category["title"]),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _productDescriptionCtrl,
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Description",
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.green,
                  ),
                  child: Text(
                    "${widget.canEdit ? "update" : "add"} Changes",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    widget.canEdit
                        ? _productCtrl.updateProduct(widget.product["id"], {
                            "title": _productNameCtrl.text,
                            "price": double.parse(_productPriceCtrl.text),
                            "categoryId": _selectedId,
                            "description": _productDescriptionCtrl.text,
                            "imageUrl": imageUrl,
                          })
                        : _productCtrl.add({
                            "title": _productNameCtrl.text,
                            "price": double.parse(_productPriceCtrl.text),
                            "categoryId": _selectedId,
                            "description": _productDescriptionCtrl.text,
                            "imageUrl": imageUrl,
                          });
                  },
                ),
              ),
              widget.canEdit
                  ? TextButton(
                      onPressed: () {
                        _productCtrl.delete(widget.product["id"]);
                      },
                      child: Text("Delete"))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
