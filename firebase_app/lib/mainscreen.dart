import 'package:firebase_app/flipKartUi/buyer/homescreen.dart';
import 'package:firebase_app/screen_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'flipKartUi/buyer/buyerhomeScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshort)
        {
          if(snapshort.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshort.hasError)
          {
            return const Center(child: Text('Somethinh went wrong'),);
          }
          else if(snapshort.hasData)
          {
            return  HomeScreenMain();
          }
          else{
            return const LoginScreen();
          }

        } ),
    );
  }
}