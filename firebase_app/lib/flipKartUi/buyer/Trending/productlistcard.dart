import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/buyer/productdetilasScreens/productviewscreen.dart';
import 'package:flutter/material.dart';

class ProductCardList extends StatelessWidget {
  final String name;
  final String imageurl;
  final String seller;
  final String detials;
  final String orginalprice;
  final String discountprice;
  final String offpersentage;
  final String discription;

  const ProductCardList(
      {required this.imageurl,
      required this.name,
      required this.seller,
      required this.detials,
      required this.orginalprice,
      required this.discountprice,
      required this.offpersentage,
      required this.discription,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> 
           ProductViewScreen(
            imageurl: imageurl,
            name: name,
            offpersentage: offpersentage,
            seller: seller,
            details: detials,
            orginalprice: orginalprice,
            discountprice: discountprice,
            discription: discription,
            )));
          },
          child: Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(color: textcolor, fontSize: 20),
                        ),
                        Text(seller),
                        Text(
                          'Rs $discountprice',
                          style:const  TextStyle(
                            fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 4, 182, 33),
                              fontSize: 15),
                        ),
                         Text('$offpersentage% off'), 
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
