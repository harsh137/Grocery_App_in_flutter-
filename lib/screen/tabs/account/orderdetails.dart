import 'package:flutter/material.dart';
class OrderDetails extends StatelessWidget {
    Map orderObj;
    OrderDetails
        (
    {
       required this.orderObj
    }
        );
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#${orderObj["id"]} -  ${orderObj["status"]}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Order"),
            subtitle: Text("Date:- ${orderObj["dateString"]}"),
            trailing: Text("#${orderObj["id"]}"),
          ),
          ListTile(
            title: Text("Status"),
            trailing: Text("${orderObj["status"]}"),
          ),
          ListTile(
            title: Text("Delivery"),
            subtitle: Text("Adderss-> ${orderObj["deliveryAddress"]}"),
            trailing: Text("Payment Method-> ${orderObj["paymentMethod"]}"),
          ),
          Container(
            margin: EdgeInsets.only(top:8, bottom: 8),
            padding: EdgeInsets.only(left: 12),
            child: Text("CART ITEMS",
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: orderObj["cartItems"].length,
             itemBuilder:(bc,index){
              return ListTile(
                title: Text("${orderObj["cartItems"][index]["title"]}"),
                subtitle: Text(" Qty: ${orderObj["cartItems"][index]["qty"]} x ${orderObj["cartItems"][index]["price"]}") ,
                trailing:Text("${orderObj["cartItems"][index]["total"]}") ,
              );
             },

          ),),
          Container(
            color: Colors.green,
            height: 68,
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(fontSize: 25,letterSpacing: 1.5,color: Colors.white),),
                Text("₹123",style: TextStyle(fontSize: 25,letterSpacing: 1.5,color:Colors.white),),
              ],
            ),
          )

        ],
      ),
    );
  }
}
