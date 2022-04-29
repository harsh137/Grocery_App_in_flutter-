import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/auth.dart';
import 'package:store/screens/login.dart';
import 'package:store/screens/tabs.dart';

class ValidateScreen extends StatelessWidget {
  ValidateScreen({key}) : super(key: key);

  AuthController _auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => _auth.isUserLoginIn.value ? TabsScreen() : LoginScreen());
  }
}
