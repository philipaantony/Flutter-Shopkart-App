import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/noteApp/noteappmodel.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:flutter/material.dart';

class UpdateNote extends StatelessWidget {
   final String? id;
   final String title;
   final String content;
   const UpdateNote({required this.id,required this.title,required this.content , Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
   final _titlecontroller = TextEditingController(text:title );
   final _contentcontroller = TextEditingController(text:content );

    //final noteid = widget.id;
     return Scaffold(
      appBar: AppBar(title:const  Text('Update Note'),
      leading:  IconButton(onPressed: () 
          {
            Navigator.pop(context);
           },
            icon: const  Icon(Icons.arrow_back_ios),
            color:const Color.fromARGB(255, 255, 255, 255),),),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titlecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Title'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _contentcontroller,
              maxLines: 15,
              maxLength: 500,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Type your content here....!'),
            ),
            ElevatedButton(onPressed: ()
            {
              final titledata = _titlecontroller.text;
              final contentdata = _contentcontroller.text;
              update(id.toString(), titledata, contentdata) ;
              Navigator.pop(context);
            }, child: const Text('Update Note'))
          ],
        ),
      )),
    );
  }


Future update(String id,String title,String content,) async
  {
    final notedata =NoteApp(
      id: id,
      uid: user.uid,
      title: title,
      content: content
      );
    FirebaseFirestore.instance
               .collection('NoteList')
               .doc(id).update(notedata.toJson());
  }  
}