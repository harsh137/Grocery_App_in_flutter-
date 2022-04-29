import 'package:flutter/material.dart';

class WelcomeSlide extends StatelessWidget {
  var image;
  var title;
  var subtitle;

  WelcomeSlide(image,title,subtitle)
  {
    this.image=image;
    this.title=title;
    this.subtitle=subtitle;
}

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,scale: 1.0,height: 400,),
            Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            SizedBox(height: 4,),
            Text(subtitle,textAlign: TextAlign.center,style: TextStyle(fontSize: 15,),),
          ],
        ),
      );
  }
}

