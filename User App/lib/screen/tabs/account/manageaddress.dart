import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAddress extends StatelessWidget {
  const ManageAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset("assets/images/map.png",fit: BoxFit.cover,),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        labelText: "NAME",
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
                    maxLines: 6,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        labelText: "Address",
                      )

                  ),
                  SizedBox(height: 10,),
                  TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        labelText: "Zip Code",
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
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        Get.back();
                      },
                      child: Text("Save Changes"),
                    ),
                    height: 48,
                    width: double.infinity,
                  )
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
