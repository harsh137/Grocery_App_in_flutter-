import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../welcome_screen.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({Key? key}) : super(key: key);

  @override
  _Edit_profileState createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {

  var name;
  var number;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", textAlign: TextAlign.center,),
      ),
      body:Container(
        padding: EdgeInsets.all(32),
        child: Column(

          children: [
            Expanded(
              child: Container(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png",),
                    radius: 60,
                  )
              ),
            ),
            SizedBox(height: 10,),

            TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                  labelText: "Name",
                )
            ),

            SizedBox(height: 10,),
            TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                  labelText: "Number",
                )
            ),

            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
                labelText: "Email Adderss",
              ),
            ),
            SizedBox(height: 10,),

            Container(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                child: Text("Save Changes"),
                onPressed: (){
                  Get.back();
                },
              ),
            ),
      SizedBox(height: 10,),
      Container(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          child: Text("Log Out"),
          onPressed: (){
            Get.offAll(WelcomeScreen());
          },
        ),
      ),
          ],
        ),
      ),
      );
  }
}
