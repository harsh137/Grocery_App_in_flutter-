import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/screen/register_screen.dart';
import 'tabs/tabs.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Grocery",textAlign: TextAlign.center,),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
                width: 200,
                child: Image.asset("assets/images/logo.png",height: 300,width: 200,fit: BoxFit.fill,)
            ),
            SizedBox(height: 100,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
                labelText: "Email Adderss",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
                labelText: "Password",
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(onPressed: (){
                Get.offAll(Tabs());
              }, child: Text("Login")
              ),
            ),
            TextButton(onPressed: (){
              Get.to(RegisterScreen());
            }, child: Text("Create New Account")
            ),
           Container( child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              ElevatedButton(
                style:ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 0),
                  onPressed: (){},
                  child: Image.asset("assets/images/google-icon.png",height: 40,)
              ),
               ElevatedButton(
                   style:ElevatedButton.styleFrom(primary: Colors.transparent,elevation: 0),
                   onPressed: (){},
                   child: Image.asset("assets/images/fb-icon.png",height: 40,)
               ),
             ],
           ),
           )


          ],
        ),
      ),

    );
  }
}
