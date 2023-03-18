import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/noteApp/noteappmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenAddNote extends StatelessWidget {
   ScreenAddNote({Key? key}) : super(key: key);



   final titlecontroller = TextEditingController();
   final contentcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note'),
      leading:  IconButton(onPressed: () 
          {
            Navigator.pop(context);
           },
            icon:const  Icon(Icons.arrow_back_ios),
            color:const Color.fromARGB(255, 255, 255, 255),),),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Title'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: contentcontroller,
              maxLines: 10,
              maxLength: 500,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Type your content here....!'),
            ),
            ElevatedButton(onPressed: ()
            {addNote();
            Navigator.pop(context);
            }, child: const Text('Add Note'))
          ],
        ),
      )),
    );
  }

  Future addNote() async
  {
    //final noteid = FirebaseFirestore.instance.collection('NoteList').doc();
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final addnote = FirebaseFirestore.instance
             .collection('NoteList')
             .doc();
    if(titlecontroller.text.isEmpty)
    {
      return;
    }
     if(contentcontroller.text.isEmpty)
    {
      return;
    }
    final usernote =NoteApp(
      id: addnote.id,
      uid: uid,
      title: titlecontroller.text,
      content: contentcontroller.text);
      
    final json = usernote.toJson();   
    await addnote.set(json);


  }

}
