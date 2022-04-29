import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/categories.dart';
import 'package:store/screens/manage-category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key key}) : super(key: key);
  CategoriesController _categoriesCtrl = Get.put(CategoriesController());

  /* FirebaseFirestore _db = FirebaseFirestore.instance;

  var _categories = [];

  fetchCategories() {
    _db.collection("categories").snapshots().listen((event) {
      var _tmp = [];
      event.docs.forEach((element) {
        _tmp.add({
          "id": element.id,
          "title": element.data()["title"],
        });
      });
      setState(() {
        _categories = _tmp;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(ManageCategoryScreen(
                canEdit: false,
                category: {},
              ));
            },
          )
        ],
      ),
      body: Container(
        child: Obx(
          () => ListView.builder(
            itemCount: _categoriesCtrl.categories.length,
            itemBuilder: (bc, index) {
              return ListTile(
                title: Text("${_categoriesCtrl.categories[index]["title"]}"),
                trailing: Icon(Icons.edit_outlined),
                onTap: () {
                  Get.to(ManageCategoryScreen(
                    canEdit: true,
                    category: _categoriesCtrl.categories[index],
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
