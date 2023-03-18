import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/studentmodel.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({ Key? key }) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Student Name',
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Age',
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton.icon(onPressed: ()
          {
            //onAddStudentButtonClicked();
            addStudent();
          },
          icon: const Icon(Icons.add),
          label: const Text('Add student'),
          )
        ],
      ),
      
    );
  }

  Future addStudent() async
  {
    String uid = FirebaseAuth.instance.currentUser!.uid;
   // var email = FirebaseAuth.instance.currentUser!.email;
    //DocumentReference abc = 
                          //  FirebaseFirestore.instance
                           // .collection(email.toString())
                          //  .doc(uid)
                           // .collection('Student')
                           // .doc();
    final student = FirebaseFirestore.instance.collection('Studentlist').doc();
    if(_nameController.text.isEmpty)
    {
      return;
    }
     if(_ageController.text.isEmpty)
    {
      return;
    }
    final studentuser =Student(
      id: student.id,
      uid: uid,
      student: _nameController.text,
      age: _ageController.text
      );
      
    final json = studentuser.toJson();   
    await student.set(json);


  }

  
 
  
}