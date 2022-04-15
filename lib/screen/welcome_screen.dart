import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/custom_widget/welcome_slide.dart';
import 'package:user_app/screen/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity
                ),
                items: [
                  WelcomeSlide("assets/images/slide_1.png","Get Fresh Food","Get Fresh food for your Family"),
                  WelcomeSlide("assets/images/slide_2.png","Secure Payment","All yours payments are securely processed"),
                  WelcomeSlide("assets/images/slide_3.png","Fast Delivery","Don't wait too late for your orders"),

                ],

              ),
            ),

          ),

          Container(
            height: 60,
            width: double.infinity,
            child:ElevatedButton(
              onPressed: (){
                Get.to(loginScreen());
              },
              child: Text("Get Started"),
            ) ,
          )

        ],
      ),
    );
  }
}

