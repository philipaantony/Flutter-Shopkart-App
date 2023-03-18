import 'package:firebase_app/flipKartUi/buyer/buyer_profile/buyerprofile.dart';
import 'package:firebase_app/flipKartUi/buyer/buyer_profile/profilestreamer.dart';
import 'package:firebase_app/flipKartUi/buyer/buyerhomescreen.dart';
import 'package:firebase_app/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

static const routeName = 'add_transactionss';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      routes: {
        BuyerHomeScreen.routeName:(context) =>  BuyerHomeScreen(),
        ProfileStreamer.routeName1:(context) =>  ProfileStreamer(),
        //ScreenAddTransaction.r:(context) => const ScreenAddTransaction(),
        //'ScreenAddTransaction':(ctr){ return ScreenAddTransaction();},
        //OnTapOn.philipp:(context) => const OnTapOn(),
        //'Ontopon':(ctr){ return   OnTapOn(,);},
      },
    );
  }
}



