
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Drawer/drawer.dart';
import 'package:firebase_app/noteApp/addnote.dart';
import 'package:firebase_app/noteApp/noteappmodel.dart';
import 'package:firebase_app/noteApp/updatenote.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreeHomeNoteApp extends StatelessWidget {
  ScreeHomeNoteApp({Key? key}) : super(key: key);

  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: const Text('NoteApp')),
      body: StreamBuilder<List<NoteApp>>(
          stream: readNote(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final notedata = snapshot.data!;
              return GridView(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),

                children: notedata.map(buildNote).toList(),
              );
            } else if (snapshot.hasError) {
              return const Text('Something went wrong......!');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ScreenAddNote();
            }));
          },
          icon: const Icon(Icons.add),
          label: const Text('New Note')),
    );
  }
}

Stream<List<NoteApp>> readNote() => FirebaseFirestore.instance
    .collection('NoteList')
    .where('uid', isEqualTo: user.uid)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => NoteApp.fromJson(doc.data())).toList());

Widget buildNote(NoteApp noteapp) => Builder(builder: (ctx) {
      return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                 Navigator.of(ctx).push(MaterialPageRoute(builder:(ctx)=>
                  UpdateNote(id: noteapp.id, title: noteapp.title, content: noteapp.content)));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            noteapp.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final notedel = FirebaseFirestore.instance
                                .collection('NoteList')
                                .doc(noteapp.id);

                            notedel.delete();
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    ),
                    Text(
                      noteapp.content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
