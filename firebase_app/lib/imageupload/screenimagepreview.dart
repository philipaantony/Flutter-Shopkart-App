import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/imageupload/gridcard.dart';
import 'package:firebase_app/imageupload/imageupload.dart';
import 'package:firebase_app/imageupload/modelimage.dart';

import 'package:flutter/material.dart';

class ImagePriview extends StatelessWidget {
  const ImagePriview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('imageview'),),
      body: StreamBuilder<List<ImageList>>(
        stream: readUrl(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
          final imagedata = snapshot.data!;
          return SafeArea(
            child: GridView.count(
              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1 / 1.4,
                              children: imagedata.map(buildImage).toList(),
      
            )
          );
        }else if (snapshot.hasError) {
              return const Text('Something went wrong......!');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=> UploadImage()));
      },child:const  Icon(Icons.upload_file),),
    );
  }


 Stream<List<ImageList>> readUrl() => FirebaseFirestore.instance
    .collection('ImageUrl')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ImageList.fromJson(doc.data())).toList()); 
}

Widget buildImage(ImageList imageList) => Builder(builder: (ctx) {
      return GrideCard(imageList: imageList.imageURL);
    });