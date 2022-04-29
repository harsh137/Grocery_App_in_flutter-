import 'package:flutter/material.dart';


class CartItems extends StatelessWidget {

  var  imageURL;
  var title;
  var qty;
  var price;
  var total;

  CartItems (var img , var tit , var  Q , var P , var T   )
  {
    imageURL=img ;
    title=tit;
    qty=Q;
    price=P;
    total=T;
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(20.0),
            child: Container(
              child: Image.asset("$imageURL",
                  height: 60,width: 60,fit:BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$title",style: TextStyle(
                    fontSize:18,
                  ),
                  ),
                  Text("$qty X $price"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  RawMaterialButton(
                      onPressed: (){},
                      fillColor: Colors.green,
                      elevation: 0,
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.add,color: Colors.white,size: 16,),
                      shape: CircleBorder(),
                    constraints: BoxConstraints(),
                  ),
                  Text("$qty"),
                  RawMaterialButton(
                    onPressed: (){},
                    fillColor: Colors.green,
                    elevation: 0,
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.remove,color: Colors.white,size: 16,),
                    shape: CircleBorder(),
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ),
          ),
          Container(child: Text("Rs:-${qty*price}"),),
        ],
      ),
    );
  }
}




