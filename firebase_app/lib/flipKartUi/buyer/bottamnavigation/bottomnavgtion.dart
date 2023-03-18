import 'package:firebase_app/flipKartUi/buyer/homescreen.dart';
import 'package:flutter/material.dart';

class NavigatiobBarWidget extends StatelessWidget {
  const NavigatiobBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreenMain.selectedIndexNotifer,
      builder: (BuildContext ctx, int updatedIndex, Widget? _)
      {
        return BottomNavigationBar(
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Colors.grey,
        currentIndex: updatedIndex,
        onTap: (newIndex){
           HomeScreenMain.selectedIndexNotifer.value = newIndex;
        },
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ShopKart'),
          BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits),
          label: 'All Product'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile')
      ]
      );
      }, 
      
    );
  }
}