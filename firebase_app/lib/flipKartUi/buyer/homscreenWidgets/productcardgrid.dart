import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/buyer/productdetilasScreens/productviewscreen.dart';
import 'package:flutter/material.dart';

class ProductWidgetOnGrid extends StatelessWidget {
  final String name;
  final String seller;
  final String imageurl;
  final String detials;
  final String orginalprice;
  final String discountprice;
  final String offpersentage;
  final String discription;

  const ProductWidgetOnGrid({
    required this.imageurl,
    required this.name,
     required this.seller,
     required this.detials,
    required this.orginalprice,
    required this.discountprice,
    required this.offpersentage,
    required this.discription,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(border: Border.all(color: Color.fromARGB(255, 210, 217, 230)),color: backgroundcolor),
        //color: backgroundcolor,
        //height: 250,
        width: 180,

        child: GestureDetector(
          onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> 
           ProductViewScreen(
            seller: seller,
            imageurl: imageurl,
            name: name,
            details: detials,
            offpersentage: offpersentage,
            orginalprice: orginalprice,
            discountprice: discountprice,
            discription: discription,
            )));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(imageurl))),
        
                      height: 140,
                      width: 140,
                      //color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(color: textcolor, fontSize: 15,fontWeight: FontWeight.w700),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$discountprice Rs',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 13, 156, 0),
                      ),
                    ),
                    Text(
                      '$orginalprice',
                      style: TextStyle(
                          color: Color.fromARGB(255, 236, 4, 4),
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Text(
                  ' $discription',
                  style: TextStyle(color: textcolor),
                ),
                Text(
                  '$offpersentage% off',
                  style: TextStyle(color: textcolor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
