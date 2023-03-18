import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/flipKartUi/buyer/homscreenWidgets/productcardgrid.dart';
import 'package:firebase_app/flipKartUi/firebase/stream.dart';
import 'package:firebase_app/flipKartUi/model/productmodel.dart';
import 'package:flutter/material.dart';

class GridStram extends StatelessWidget {
  const GridStram({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
        child: StreamBuilder<List<Product>>(
          stream: readProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final student = snapshot.data!;
              return 
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 0.1,
                  crossAxisSpacing: 0.1,
                  crossAxisCount: 2,
                  scrollDirection:Axis.vertical ,
                  childAspectRatio: 1 / 1.7,
                  children: student.map(buildStudent).toList()),
              );
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







  Widget buildStudent(Product student) => ProductWidgetOnGrid(
    seller: student.seller,
    imageurl: student.imageurl, 
    name: student.name, 
    detials: student.details,
    orginalprice: student.orginalprice,
    discountprice: student.discountprice,
    offpersentage: student.offpersentage,
    discription: student.discription);
}


// GridView.count(
              //   physics: const ScrollPhysics(),
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 2,
              //   crossAxisSpacing: 2,
              //   childAspectRatio: 1 / 1.5,
              //   children: List.generate(20, (index) {
              //     return Builder(builder: (context) {
              //       return const  ProductWidget(
              //             imageurl: '',
              //             name: 'new',
              //             orginalprice: '1000',
              //             discountprice: '200',
              //             offpersentage: '12',
              //             discription: 'mi band');;
              //     });
              //   }),
              // )