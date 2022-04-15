import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  var image;
  var title;
  var price;

  ProductCard(var image,var title,var price)
  {
    this.image=image;
    this.title=title;
    this.price=price;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: [
          Align(
            child:Container(
            height: double.infinity,
            width: double.infinity,
        child: Image.asset(image,fit: BoxFit.cover,),
          ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity((0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 155,left: 5),
                    child: Column(
                      children: [
                        Text(title,style: TextStyle(color: Colors.white),),
                         Text("$price",style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
          )
     ]
      ),

    );
  }
}
