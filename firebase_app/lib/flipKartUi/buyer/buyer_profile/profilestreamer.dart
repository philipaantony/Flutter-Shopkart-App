import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/buyerprofile.dart';
import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/buyer/homescreen.dart';
import 'package:firebase_app/flipKartUi/firebase/stream.dart';

import 'package:firebase_app/flipKartUi/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileStreamer extends StatelessWidget {
  static const routeName1 = 'profilescreen';
  ProfileStreamer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<List<UserDetails>>(
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
      ),
    );
  }

 
  Widget buildUser(UserDetails userr) => Builder(builder: (context) {
        return SizedBox(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(child: Builder(builder: (context) {
                              return Image.network(userr.profileimage);
                            })),
                          )),
                    ),
                  ),

                  Text(userr.name,
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 23,
                          fontWeight: FontWeight.w700)),

                  ///
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(Icons.email_rounded,
                      color: Color.fromARGB(255, 0, 0, 0)),
                      const SizedBox(
                width: 5,
              ),  
                  Text(userr.email,
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.call),
                   const SizedBox(
                width: 5,
              ),  
                  Text(userr.moblieno,
                      style: TextStyle(
                        color: textcolor,
                        fontSize: 15,
                      )),
                ],
              ),
              const SizedBox(height: 10,),
              const Text('Shipping Address:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 93, 92, 92),
                    fontSize: 15,
                  )),
              Text(userr.address,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 15,
                  )),
              Text(userr.pincode,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 15,
                  )),
              Text(userr.state,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 15,
                  )),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Edit Profile'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => BuyerProfile()));
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.settings,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Settings'),
                onTap: () {},
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_basket,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Cart'),
                onTap: () {},
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.sell_sharp,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('Sell product'),
                onTap: () {},
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
                ListTile(
                leading: const Icon(Icons.logout_rounded,
                    color: Color.fromARGB(255, 0, 0, 0)),
                title: const Text('LogOut'),
                onTap: () {
                  pages[1];
                   FirebaseAuth.instance.signOut();
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ));
      });
}
