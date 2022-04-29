import 'package:flutter/material.dart';
import 'package:user_app/custom_widget/cart_items.dart';
class cartScreen extends StatefulWidget {
  @override
  State<cartScreen> createState() => _cartScreenState();
}
class _cartScreenState extends State<cartScreen> {
 List cartItems =
[
  {
    "imageURL": "assets/images/products/1.jpg",
    "title": "Carrot",
    "qty": 1,
    "price": 20.0,
    "total": 20.0,
  },
  {
    "imageURL": "assets/images/products/5.jpg",
    "title": "Raw Meat",
    "qty": 2,
    "price": 320.0,
    "total": 640.0,
  },
  {
    "imageURL": "assets/images/products/8.jpg",
    "title": "Orange",
    "qty": 1,
    "price": 170.0,
    "total": 170.0,
  }
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Container(
        child: Column(

          children: [
            Expanded(
              child:
              ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (bc,index)
                  {
                return CartItems(cartItems[index]["imageURL"],cartItems[index]["title"],cartItems[index]["qty"],cartItems[index]["price"],cartItems[index]["total"]);
               }
              ),
            ),
             ListTile(
              title: Text("Delivery Address"),
              subtitle: Text("!3 Flutter Club, Earth -0002"),
              trailing: TextButton(
                onPressed: () {},
                child: Text("change"),
              ),
            ),
            ListTile(
              title: Text("Payment Method"),
              subtitle: Text("COD"),
              trailing: TextButton(
                onPressed: () {},
                child: Text("change"),
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (){},
                child: Text("Checkout Rs:-220" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

