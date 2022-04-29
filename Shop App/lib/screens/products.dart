import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/products.dart';
import 'package:store/screens/categories.dart';
import 'package:store/screens/manage-product.dart';

class ProductsScreen extends StatelessWidget {
  ProductController _productCtrl = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(ManageProductScreen(canEdit: false, product: {}));
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextButton(
                  onPressed: () {
                    Get.to(CategoriesScreen());
                  },
                  child: Text("Manage Categories")),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _productCtrl.product.length,
                  itemBuilder: (bc, index) {
                    return ListTile(
                      title: Text("${_productCtrl.product[index]["title"]}"),
                      subtitle: Text("${_productCtrl.product[index]["price"]}"),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                        ),
                        onPressed: () {
                          Get.to(ManageProductScreen(
                            canEdit: true,
                            product: _productCtrl.product[index],
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
