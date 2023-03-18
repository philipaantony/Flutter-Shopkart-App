import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/DashBoard/dashboard.dart';
import 'package:firebase_app/HomeDashScreem/homedash.dart';
import 'package:firebase_app/flipKartUi/buyer/buyerhomeScreen.dart';

import 'package:firebase_app/imageupload/screenimagepreview.dart';
import 'package:firebase_app/model/user.dart';
import 'package:firebase_app/noteApp/screehome_noteapp.dart';
import 'package:firebase_app/profile/profile.dart';
import 'package:firebase_app/screenhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  var email = FirebaseAuth.instance.currentUser!.email;

  Stream<List<UserDetials>> readUser() => FirebaseFirestore.instance
      .collection('UserList')
      .where('uid', isEqualTo: user.uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => UserDetials.fromJson(doc.data()))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: StreamBuilder<List<UserDetials>>(
                stream: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final student = snapshot.data!;
                    return SizedBox(
                        height: 30,
                        child: ListView(
                            children: student.map(buildUser).toList()));
                  } else {
                    return const Text('unable to load data');
                  }
                }),
            accountEmail: Text(email!),
            currentAccountPicture: const CircleAvatar(
              radius: 39,
              backgroundColor: Colors.green,
              backgroundImage: AssetImage('asset/images/philip.jpg'),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage('asset/images/windows.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.shop,
              color: Color.fromARGB(255, 0, 1, 3),
            ),
            title: const Text('ShopKart'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => BuyerHomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ScreenDash()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: const Text('Edit Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => ProfilePage(
                        uid: user.uid,
                        username: 'philip',
                        email: 'philip@gmail.com',
                      )));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
              color: Colors.blue,
            ),
            title: const Text('DashBoard'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => DashBoard()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.note_add,
              color: Color.fromARGB(255, 7, 10, 86),
            ),
            title: const Text('NoteApp'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => ScreeHomeNoteApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: const Text('Favoriate'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip,
              color: Colors.orange,
            ),
            title: const Text('Student App'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ScreenHome()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.image_aspect_ratio,
              color: Color.fromARGB(255, 0, 1, 3),
            ),
            title: const Text('ImagePriview'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => ImagePriview()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('logOut'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildUser(UserDetials userDetials) => SizedBox(
        child: Text(userDetials.username),
      );
}
