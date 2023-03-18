import 'package:firebase_app/flipKartUi/buyer/buyerhomescreen.dart';
import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/sliderstreamer.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatelessWidget {
  final String name;
  final String imageurl;
  final String seller;
  final String details;
  final String orginalprice;
  final String discountprice;
  final String offpersentage;
  final String discription;

  const ProductViewScreen(
      {required this.imageurl,
      required this.name,
      required this.seller,
      required this.details,
      required this.orginalprice,
      required this.discountprice,
      required this.offpersentage,
      required this.discription,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
                Navigator.of(context).push(
                 MaterialPageRoute(builder: (ctx) => BuyerHomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: textcolor,
            )),
        title: Text(
          'ShopKart',
          style: TextStyle(color: textcolor),
        ),
        actions: [
          IconButton(
              onPressed: () {
              
              },
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: textcolor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    image: DecorationImage(
                        fit: BoxFit.contain, image: NetworkImage(imageurl))),
      
                height: 300,
                //width: 300,
                //color: Color.fromARGB(255, 255, 255, 255),
              ),
             const SizedBox(height: 20,),
              Text(
                name,
                style: TextStyle(
                    color: textcolor, fontSize: 32, fontWeight: FontWeight.w700),
              ),
             const SizedBox(height: 4,),
              Text(
                'Category: $discription',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price $discountprice/- Rs ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 1, 173, 24),
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    ' $orginalprice/- Rs',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 236, 4, 4),
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              Text(
                '$offpersentage' '% off on this product',
                style: TextStyle(color: textcolor, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                'Seller : $seller',
                style: TextStyle(color: textcolor, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              
              const SizedBox(
                height: 10,
              ),
              Text(
                'Free Delivery Available',
                style: TextStyle(
                    color: textcolor, fontSize: 15, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                              primary:const Color.fromARGB(255, 255, 128, 0),
                              shape: const StadiumBorder()),
                    child:const Text('Exchange Product',),
                    ),
                  ),
                   SizedBox(
                    width: 150,
                     child: ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                              primary:const Color.fromARGB(255, 255, 128, 0),
                              shape: const StadiumBorder()),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Text('Add to Cart'),SizedBox(width: 5,),
                      Icon(Icons.add_shopping_cart_outlined),
                    ],
                  )),
                   )
                ],
              ),
              const SizedBox(height: 20,),
              const Divider(
                height: 10,
              ),
                const SizedBox(
                height: 10,
              ),
               Text(
                'More Detials',
                style: TextStyle(
                    color: textcolor, fontSize: 15, fontWeight: FontWeight.w500),
              ),
                const SizedBox(
                height: 10,
              ),
              Text(
                details,
                style: TextStyle(
                    color: textcolor, fontSize: 15, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 20,
              ),
              
              Center(
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                      onPressed: () {

                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary:const Color.fromARGB(255, 0, 128, 255),
                        shape: const StadiumBorder()), 
                      child: const Text('BUY')),
                ),
                
              ),
               const SizedBox(
                height: 15,
              ),
             const Divider(),
                 const SizedBox(
                height: 15,
              ),
               Text(
                'Trending Products',
                style: TextStyle(
                    color: textcolor, fontSize: 15, fontWeight: FontWeight.w500),
              ),
                const SizedBox(
                height: 10,
              ),
              const SliderStreamer(),
                const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
