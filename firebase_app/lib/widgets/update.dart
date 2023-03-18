
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/studentmodel.dart';
import '../screenhome.dart';

Future<void> updateData(String id,String name,String age,BuildContext context)
{

  
  final nameController = TextEditingController(text: name);
  final ageController = TextEditingController(text: age);
  return showDialog(
  
  context: context,
   builder: (BuildContext context)
   {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: AlertDialog(   
          title: const Text('Update Data'),
          content: Container(
            height: 225,
            child: Column(
                children: [
                  const SizedBox(height: 15),
                 
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(   
                      controller: ageController,
                      decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(onPressed: ()
                      {

                      final newid =id;
                      final newname =nameController.text;  
                      final newage =ageController.text;
                      update(newid,newname,newage);
                      Navigator.of(context).pop();
                      
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Update'),
                      ),
                      const  SizedBox(width: 20,),
                       ElevatedButton.icon(onPressed: ()
                      {
                      // update();
                       Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Go Back'),
                      ),
                    ],
                  ),
                ],
              ),
          ),    
       ),
     )
     
     
     ;

   }
 );

}

Future update(String id,String name,String age,) async
  {
   // String uid = FirebaseAuth.instance.currentUser!.uid;
    //var email = FirebaseAuth.instance.currentUser!.email;

   

    final studentuser =Student(
      id: id,
      uid: user.uid,
      student: name,
      age: age,
      );
    FirebaseFirestore.instance
              // .collection(email.toString())
               //.doc(uid)
               .collection('Studentlist')
               .doc(id).update(studentuser.toJson());

      
    //final json = studentuser.toJson();   
    //await student.set(json);


  }