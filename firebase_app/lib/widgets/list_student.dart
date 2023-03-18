import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/studentmodel.dart';
import 'package:firebase_app/widgets/update.dart';
import 'package:firebase_app/widgets/updatebottomsheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user =FirebaseAuth.instance.currentUser!;
//String uid = FirebaseAuth.instance.currentUser!.uid;
var email = FirebaseAuth.instance.currentUser!.email;
//final studentnew = FirebaseFirestore.instance.collection('Studentlist');
//var ref = studentnew.where('uid',isEqualTo: user.uid);

class Liststudent extends StatefulWidget {
  const Liststudent({Key? key}) : super(key: key);

  @override
  State<Liststudent> createState() => _ListstudentState();
}

//final nameController = TextEditingController();
//final ageController = TextEditingController();



class _ListstudentState extends State<Liststudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Student>>(
        stream: readUser(),
        builder: (context, snapshot) {
        
         
          if (snapshot.hasData) {
            final student = snapshot.data!;
            return ListView(
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

  Stream<List<Student>> readUser() => FirebaseFirestore.instance
      .collection('Studentlist')
      .where('uid' , isEqualTo: user.uid)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Student.fromJson(doc.data())).toList());





  Widget buildStudent(Student student) => SizedBox(
        height: 60,
        child: ListTile( 
            leading: CircleAvatar(
                radius: 40,
                child: Text(
                  'Age\n ${student.age}',
                  style: const TextStyle(fontSize: 12),
                )),
            title: Text(student.student),
            
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){ 
                  updateData(student.id,student.student,student.age,context);
                  }, icon: const Icon(Icons.upgrade)),
                IconButton(
                    onPressed: () 
                    {
                      updateData2(student.id,student.student,student.age,context);
                      //updateData(student.id,student.student,student.age,context);
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) 
                    // {
                    //   return UpdateScreen(id: student.id,name: student.student,age: student.age,);
                     
                    // }));
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                  onPressed: () {
                    final docUser = FirebaseFirestore.instance
                        .collection('Studentlist')
                        .doc(student.id);
                    docUser.delete();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            )),
      );
}
