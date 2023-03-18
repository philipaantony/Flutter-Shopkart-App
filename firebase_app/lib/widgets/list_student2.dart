

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Liststudent2 extends StatelessWidget {
  const Liststudent2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Student').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
        {
          if(!snapshot.hasData)
          {
            return const CircularProgressIndicator();
          }     
            return ListView(
              children:snapshot.data!.docs.map((documnet)
              {
                return Center(child: Text(documnet['student'] ));
              }).toList(),
                   ) ;
          },
        )
    );
  }
}

