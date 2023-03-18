import 'package:firebase_app/Drawer/drawer.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/buyerprofile.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/buyperprofileview.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/profilestreamer.dart';
import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/shopkartserachbar.dart';
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/sliderstreamer.dart';
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/gridstreamer.dart';
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/titlecarde.dart';
import 'package:firebase_app/flipKartUi/seller/addproduct.dart';
import 'package:firebase_app/profile/profile.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyerHomeScreen extends StatelessWidget {
   BuyerHomeScreen({Key? key}) : super(key: key);

   static const routeName = 'buyerhomescreen';
   var userid = FirebaseAuth.instance.currentUser!.uid;

  List<String> itemname = ['Trending','Smart Watch','Dress','Laptops','SmartPhones','HeadPhone'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      
      backgroundColor: backgroundcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: textcolor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Best OutFits for you',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 101, 100, 100)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const ShopKartSerachBar(
                      outlineInputBorder: outlineInputBorder),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.filter))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                //width: 150,
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemname.length,
                    itemBuilder: (context, index) {
                      return  TitleWidget(value: itemname[index]);
                    }),
              ),
              const SizedBox(
                height: 21,
              ),
              Text('Trending',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: textcolor)),
              const SliderStreamer(),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left:10),
                child: Text(
                  'Popular Product',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: textcolor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  color:Color.fromARGB(255, 255, 255, 255),
                  child: const GridStram()),

            ],
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(8)));
