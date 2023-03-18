import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_app/flipKartUi/buyer/homescreen.dart';
import 'package:firebase_app/flipKartUi/model/usermodel.dart';

import 'package:firebase_app/screen_login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  PlatformFile? pickedFile;
  Image? selectedimage = null;
  UploadTask? uploadTask;
  final nameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final pincontroller = TextEditingController();
  final statecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text("Sign In ",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text('Create New Account',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.black)),
                    ),
      
                    Container(
                      height: 250.0,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 25.0),
                                    child: Text('User Profile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            fontFamily: 'sans-serif-light',
                                            color: Colors.black)),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Stack(fit: StackFit.loose, children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: BorderRadius.circular(100),
                                      child: Builder(builder: (context) {
                                        if (selectedimage == null) {
                                          return  const SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: Center(
                                                child: Text('Preview')),
                                          );
                                        } 
                                        
                                        else {
                                          return SizedBox(
                                              height: 150,
                                              width: 150,
                                              child: selectedimage);
                                        }
                                      })),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 100.0, left: 100.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor:
                                              Color.fromARGB(255, 255, 255, 255),
                                          radius: 23.0,
                                          child: IconButton(
                                              onPressed: selectFile,
                                              icon:const  Icon(
                                                Icons.photo_camera,
                                                color: Colors.black,
                                              )))
                                    ],
                                  )),
                            ]),
                          )
                        ],
                      ),
                    ),
      
      
      
      
      
      
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: addresscontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Address.',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: phonecontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Phone No.',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
      
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: pincontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Pin Code.',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: statecontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'State',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    ),
      
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () {
                        signup();
                      },
                      child: Container(
                          height: 60.0,
                          width: size.width,
                          decoration: const BoxDecoration(
                              color: Color(0xFF653bbf),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: const Center(
                            child: Text('Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text('Create New Account ',
                          style: TextStyle(
                              color: Color(0xFF653bbf),
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0)),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 80, height: 1.0, color: Colors.black12),
                        const SizedBox(width: 20.0),
                        const Text('OR',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0)),
                        const SizedBox(width: 20.0),
                        Container(width: 80, height: 1.0, color: Colors.black12),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (ctx) {
                          return const LoginScreen();
                        }));
                      },
                      child: Container(
                          height: 60.0,
                          width: size.width,
                          decoration: const BoxDecoration(
                              color: Color(0xFF653bbf),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: const Center(
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
   Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
    setState(() {
      // fileselecterindicator = pickedFile!.name;
      selectedimage = Image.file(
        File(pickedFile!.path!),
      );
    });
  }
 

   Future signup() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim())
        .then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return HomeScreenMain();
      }));
      addimage();
    }).onError((error, stackTrace) {});
  }

 Future addimage() async {
    final file = File(pickedFile!.path!);
    final path = 'userimage/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshort = await uploadTask!.whenComplete(() {});
    final urldownload = await snapshort.ref.getDownloadURL();
    //print('Dounload url : $urldownload');
    adduserdetilastocollection(urldownload);
  }
  


  Future adduserdetilastocollection(url) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final useruser = FirebaseFirestore.instance.collection('UserDetailsList').doc(uid);

    if (nameController.text.isEmpty) {
      return;
    }
    if (emailcontroller.text.isEmpty) {
      return;
    }
    if (passwordcontroller.text.isEmpty) {
      return;
    }
     if (addresscontroller.text.isEmpty) {
      return;
    }
     if (pincontroller.text.isEmpty) {
      return;
    }
     if (statecontroller.text.isEmpty) {
      return;
    }
     if (passwordcontroller.text.isEmpty) {
      return;
    }
    final userdetials = UserDetails(

      id: uid,
      name: nameController.text,
      profileimage: url,
      address: addresscontroller.text, 
      email: emailcontroller.text, 
      moblieno: phonecontroller.text, 
      pincode: pincontroller.text, 
      state: statecontroller.text);
        

    final json = userdetials.toJson();
    await useruser.set(json);
  }
}
