import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:user_app/screen/tabs/account/address_screen.dart';

import 'edit_profile.dart';
import 'orders.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
     body: ListView(
       children: [
         ListTile(
           leading: CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png"),),
           title: Text("Harsh Gupta"),
           subtitle: Text("8825334559"),
           trailing: TextButton(
             onPressed: (){
              Get.to(Edit_profile());
             },
             child: Text("Edit"),
           ),
         ),

         ListTile(
           leading: Icon(Icons.notification_add),
           title: Text("Notification"),
           subtitle: Text("Tap To Turn Off"),
           trailing:RollingSwitch.icon(onChanged:(i){},
             innerSize: 41,
             width: 100,
             onTap: (){},
             initialState: false,
           rollingInfoLeft: RollingIconInfo(
             icon: Icons.lightbulb_outline_rounded,
             text: Text("ON"),
             backgroundColor: Colors.red,
           ),
             rollingInfoRight: RollingIconInfo(
               icon: Icons.check,
               text: Text("OFF"),
               backgroundColor: Colors.green,
             ),
           )
           ),

         ListTile(
             leading: Icon(Icons.shopping_bag_outlined),
             title: Text("My Orders"),
             subtitle: Text("Manage Orders"),
             trailing:IconButton(
               onPressed: (){
                 Get.to(()=>OrderScreen());
               },
               icon: Icon(Icons.keyboard_arrow_right_outlined),
             )
         ),

         ListTile(
             leading: Icon(Icons.notes_outlined),
             title: Text("My Addresses"),
             subtitle: Text("Manage Addresses"),
             trailing:IconButton(
               onPressed: (){
                 Get.to(() => AddressScreen());
               },
               icon: Icon(Icons.keyboard_arrow_right_outlined),
             )
         ),

       ],
     ),
    );
  }
}
