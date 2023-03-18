import 'package:firebase_app/flipKartUi/buyer/Trending/productlistcard.dart';
import 'package:firebase_app/flipKartUi/firebase/stream.dart';
import 'package:firebase_app/flipKartUi/model/productmodel.dart';
import 'package:flutter/material.dart';

class ProductallStreamer extends StatelessWidget {
  const ProductallStreamer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 235, 235, 235) ,
      body:
       Container(
        child: StreamBuilder<List<Product>>(
            stream: readallproducr(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userd = snapshot.data!;
                return ListView(children: userd.map(buildpro).toList());
              } else if (snapshot.hasError) {
                return const Text('Something went wrong......!');
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget buildpro(Product pro) => 
  // SizedBox(
  //   child: Text(pro.name),
  // );
  
   ProductCardList(
      imageurl: pro.imageurl,
      name: pro.name,
      seller: pro.seller,
      detials: pro.details,
      orginalprice: pro.orginalprice,
      discountprice: pro.discountprice,
      offpersentage: pro.offpersentage,
      discription: pro.discription);
}
