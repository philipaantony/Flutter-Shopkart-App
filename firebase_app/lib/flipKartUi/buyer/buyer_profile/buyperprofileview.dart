import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/buyerprofile.dart';
import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/model/usermodel.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (BuildContext ctx) {
              
              return IconButton(
                onPressed: () {
                  Scaffold.of(ctx).openDrawer();
                },
                icon: const Icon(Icons.sort_rounded),
                color: iconcolor,
              );
            },
          ),
        ),
        title: Text(
          'ShopKart',
          style: TextStyle(color: textcolor),
        ),
         actions: [
           IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) =>  BuyerProfile()));
              },
              icon: Icon(
                Icons.person,
                color: iconcolor,
              )),]
      ),
      body: StreamBuilder<List<UserDetails>>(
          stream: readUserdetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userd = snapshot.data!;
              return ListView(children: userd.map(buildUser).toList());
            } else if (snapshot.hasError) {
              return const Text('Something went wrong......!');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Stream<List<UserDetails>> readUserdetails() => FirebaseFirestore.instance
      .collection('UserDetials')
      //.where('id', isEqualTo: user.uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => UserDetails.fromJson(doc.data()))
          .toList());
}

Widget buildUser(UserDetails userr) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(userr.name),
          Text(userr.email),
          Text(userr.address),
          Text(userr.moblieno),
          Text(userr.pincode),
          Center(
            child: Builder(builder: (context) {
              return SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => BuyerProfile(
                            // currentuserid: user.uid,
                            // name: userr.name,
                            // address: userr.address,
                            // state: userr.state,
                            // moblienumber: userr.moblieno,
                            // pin:userr.pincode,
                            // imageurl: userr.profileimage,
                            
                              )));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 128, 255),
                        shape: const StadiumBorder()),
                    child: const Text('Edit Profile')),
              );
            }),
          ),
        ],
      ),
    );
