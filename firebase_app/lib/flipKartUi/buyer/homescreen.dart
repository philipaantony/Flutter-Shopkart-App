import 'package:firebase_app/Drawer/drawer.dart';
import 'package:firebase_app/flipKartUi/buyer/Trending/productliststream.dart';
import 'package:firebase_app/flipKartUi/buyer/bottamnavigation/bottomnavgtion.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/buyerprofile.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/profilestreamer.dart';
import 'package:firebase_app/flipKartUi/buyer/buyerhomescreen.dart';
import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/seller/addproduct.dart';
import 'package:flutter/material.dart';

 

 
 final pages = [
    BuyerHomeScreen(),
    const  ProductallStreamer(),
    ProfileStreamer(),
   

  ];

class HomeScreenMain extends StatelessWidget {
   HomeScreenMain({ Key? key }) : super(key: key);


   static ValueNotifier<int> selectedIndexNotifer = ValueNotifier(0);

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (BuildContext ctx){
              return  IconButton(
              onPressed:  (){
          
               Scaffold.of(ctx).openDrawer();
          
              },icon:const Icon(Icons.sort_rounded),color: iconcolor, );
            },
            
          ),
        ), 
        title: Text(
          'ShopKart',
          style: TextStyle(color: textcolor),
        ),
        actions: [
          
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const AddProduct()));
              },
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: iconcolor,
              ))
        ],
      ),
      bottomNavigationBar: const NavigatiobBarWidget() ,
      body: SafeArea(
          child:
        ValueListenableBuilder(
        valueListenable: selectedIndexNotifer,
        builder: (BuildContext context, int updatedIndex, _) 
        {
          return pages[updatedIndex]; 
        },
      )
      ),
      
      
    );
  }
}