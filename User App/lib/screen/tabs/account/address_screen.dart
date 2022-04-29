import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'manageaddress.dart';
class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addresses"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Home"),
            subtitle: Text("Shree durga hardware store main road katras"),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                Get.to(()=> ManageAddress());
              },
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=> ManageAddress());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
