
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/productcard.dart';
import 'package:firebase_app/flipKartUi/firebase/stream.dart';
import 'package:firebase_app/flipKartUi/model/productmodel.dart';
import 'package:flutter/material.dart';

class SliderStreamer extends StatelessWidget {
 const  SliderStreamer ({ Key? key }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        color:const Color.fromARGB(185, 255, 255, 255),
        height: 280,
        child: StreamBuilder<List<Product>>(
          stream: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final student = snapshot.data!;
              return ListView(
                scrollDirection:Axis.horizontal ,
                children: student.map(buildStudent).toList());
              }
             else if (snapshot.hasError) 
             {
              return const Text('Something went wrong......!');
             }
             else
              {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
         
          ,
        ),
      );
  }







  Widget buildStudent(Product student) => ProductWidget(
    seller: student.seller,
    imageurl: student.imageurl, 
    name: student.name, 
    detials: student.details,
    orginalprice: student.orginalprice,
    discountprice: student.discountprice,
    offpersentage: student.offpersentage,
    discription: student.discription);
}

// return Container(
                  //   height: 260,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 8,
                  //       itemBuilder: (context, index) {
                  //         return ProductWidget(
                  //             name: '',
                  //             orginalprice: '',
                  //             discountprice: '',
                  //             offpersentage: '',
                  //             discription: '');
                  //       }
                  //       ),
                  // );
