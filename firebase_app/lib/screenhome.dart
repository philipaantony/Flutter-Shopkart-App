
import 'package:firebase_app/Drawer/drawer.dart';
import 'package:firebase_app/widgets/add_student.dart';
import 'package:firebase_app/widgets/list_student.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

final user =FirebaseAuth.instance.currentUser!;

class ScreenHome extends StatelessWidget {
   const ScreenHome({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    //call function here

    return Scaffold(
      drawer:DrawerWidget(),
      appBar: AppBar(
        title: const Text('FireBase App'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
          child: Column(
          children: [
          Container(
            padding:const  EdgeInsets.all(20),
            child: Row(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome  ',), 
                Text(user.email!),
              ],
            ),
          ),  
          const SizedBox(height: 10),
          AddStudentWidget(),
          const Divider(),
          const Expanded(child: Liststudent()),
        ],
      )),
    );
  }
}
