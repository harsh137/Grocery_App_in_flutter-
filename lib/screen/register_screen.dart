import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text("Local Grocery",textAlign: TextAlign.center,style: TextStyle(color: Colors.green),),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/images/logo.png",height: 300,width: 200,fit: BoxFit.fill,)
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
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: InputBorder.none,
                labelText: "Password",
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(onPressed: (){}, child: Text("Register")
              ),
            ),
            TextButton(onPressed: (){
              Get.to( loginScreen());
            }, child: Text("Already have an Account")
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
