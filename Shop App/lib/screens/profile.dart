import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/auth.dart';
import 'package:store/controller/profile.dart';

class ProfileScreen extends StatelessWidget {
  AuthController _auth = AuthController();
  static ProfileController _profile = Get.put(ProfileController());

  TextEditingController _Store_nameCtrl =
      TextEditingController(text: _profile.userObj["Store_name"]);
  TextEditingController _emailCtrl =
      TextEditingController(text: _profile.userObj["Email"]);
  TextEditingController _numberCtrl =
      TextEditingController(text: _profile.userObj["mobile"]);
  TextEditingController _Store_addressCtrl =
      TextEditingController(text: _profile.userObj["Store_address"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Edit Store"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _profile.uploadProfileImage(),
                child: Obx(
                  () => CircleAvatar(
                    backgroundImage: NetworkImage(_profile.userObj["imageURL"]),
                    radius: 60,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _Store_nameCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Store Name",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _emailCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Email Address",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _numberCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Mobile Number",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _Store_addressCtrl,
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Store Address",
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
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    _profile.updateStoreDetail({
                      "Store_address": _Store_addressCtrl.text,
                      "Email": _emailCtrl.text,
                      "Store_name": _Store_nameCtrl.text,
                      "mobile": _numberCtrl.text,
                    });
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  _auth.logout();
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
