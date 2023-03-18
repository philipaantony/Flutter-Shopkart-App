import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:flutter/material.dart';

import '../model/studentmodel.dart';

Future<void> updateData2(String id,String name,String age,BuildContext context)
{

  final nameController = TextEditingController(text: name);
  final ageController = TextEditingController(text: age);
   return showModalBottomSheet
   (
    
    backgroundColor: const Color.fromARGB(226, 255, 255, 255),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    context: context, 
    isScrollControlled: true,
    builder:  (BuildContext ctx) {
        return Padding(
          padding:const EdgeInsets.fromLTRB(40, 40, 40, 250),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                autofocus: true,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Name'),
              ),
              const SizedBox(height: 20,),
              TextField(
                autofocus: true,
                keyboardType:const TextInputType.numberWithOptions(decimal: true),
                controller: ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Age',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Update'),
                onPressed: () async 
                {
                  final newid =id;
                      final newname =nameController.text;  
                      final newage =ageController.text;
                      update(newid,newname,newage);
                      Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      });
}

Future update(String id,String name,String age,) async
  {
    //String uid = FirebaseAuth.instance.currentUser!.uid;
    //var email = FirebaseAuth.instance.currentUser!.email;

    final student = FirebaseFirestore.instance
    //.collection(email.toString())
    //.doc(uid)
    .collection('Studentlist')
    .doc(id);

    final studentuser =Student(
      id: id,
      uid: user.uid,
      student: name,
      age: age,
      );
      
    final json = studentuser.toJson();   
    await student.set(json);


  }