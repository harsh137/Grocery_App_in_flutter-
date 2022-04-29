import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/screen/welcome_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white
      ),
      home:WelcomeScreen()
    );
  }
}
