import 'package:flutter/material.dart';
class CategoryBandage extends StatelessWidget {
  var title;
  CategoryBandage({this.title});
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 5),
        height: 20,
        width: 100,
       
        child:Center(
          child: Text(title,style: TextStyle
            (fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
    );
  }
}
