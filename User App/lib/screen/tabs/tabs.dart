import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'account/AccountScreen.dart';
import 'cart/cartScreen.dart';
import 'home/homeScreen.dart';
class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _index=0;
  List _pages=[
    HomeScreen(),
   cartScreen(),
   AccountScreen(),

  ];
  changeIndex(selectIndex){
  setState(() {
    _index=selectIndex;

  });
  }
  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.greenAccent,
        selectedIndex: _index,
        showElevation: true,
        curve: Curves.easeInOutCubicEmphasized,
        itemCornerRadius:50,

        onItemSelected: changeIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined,size: 25,color: Colors.white,),
            title: Text('Home',style: TextStyle(color: Colors.white),),
              activeColor: Colors.green,
              inactiveColor: Colors.white

          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined,size: 25,),
            title: Text('Cart'),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.white
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_box_outlined,size: 25,),
            title: Text('Account'),
              activeColor: Colors.blueGrey,
              inactiveColor: Colors.white
          ),
        ],
      ),
    );
  }
}
