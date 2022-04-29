import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/profile.dart';
import 'package:store/screens/profile.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileController _profile = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: ListView(
          children: [
            Obx(
              () => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(_profile.userObj["imageURL"]),
                ),
                title: Text("${_profile.userObj["Store_name"]}"),
                subtitle: Text("${_profile.userObj["Store_address"]}"),
                trailing: TextButton(
                  onPressed: () {
                    Get.to(ProfileScreen());
                  },
                  child: Text("Edit"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text("Notifications"),
              subtitle: Text("Manage Notifications"),
              trailing: Switch(
                onChanged: (i) {},
                value: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
