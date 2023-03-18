import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_app/flipKartUi/buyer/constants.dart';
import 'package:firebase_app/flipKartUi/model/usermodel.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

var emailidofcurrentuser = FirebaseAuth.instance.currentUser!.email;

// ignore: must_be_immutable
class BuyerProfile extends StatefulWidget {
  BuyerProfile({Key? key}) : super(key: key);
   //static const routeName1 = 'buyerprofile';

  @override
  State<BuyerProfile> createState() => _BuyerProfileState();
}

class _BuyerProfileState extends State<BuyerProfile> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Image? selectedimage = null;

 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<List<UserDetails>>(
            stream: readUserdetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userd = snapshot.data!;
                return ListView(children: userd.map(buildProfile).toList());
              } 
              else if (snapshot.hasError) 
              {
                return const Text('Something went wrong......!');
              } 
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget buildProfile(UserDetails userr) => Builder(builder: (context) {
        final imageurlpass = userr.profileimage;
        final _namecontroller = TextEditingController(text: userr.name);
        final _addresscontroller = TextEditingController(text: userr.address);
        final _mobilecontroller = TextEditingController(text: userr.moblieno);
        final _pincontroller = TextEditingController(text: userr.pincode);
        final _statecontroller = TextEditingController(text: userr.state);
        final _emailcontroller = TextEditingController(text: userr.email);
        

        return SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('User Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'sans-serif-light',
                      color: Colors.black)),
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
                             
                              return SizedBox(
                                height: 150,
                                width: 150,
                                child: Center(
                                    child: Builder(
                                      builder: (context) {
                                        return Image.network(userr.profileimage);
                                      }
                                    )),
                              );
                            } else {
                              return SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: selectedimage);
                            }
                          })),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 100.0, left: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              radius: 23.0,
                              child: IconButton(
                                  onPressed: selectFile,
                                  icon: Icon(
                                    Icons.photo_camera,
                                    color: iconcolor,
                                  )))
                        ],
                      )),
                ]),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: TextFormField(
                          // initialValue: userr.name,
                          controller: _namecontroller,
                          decoration: const InputDecoration(
                            hintText: "Name",
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Email ID',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: TextFormField(
                          //initialValue: user.email,
                          enabled: false,
                          controller: _emailcontroller,
                          decoration:
                              const InputDecoration(hintText: "Enter Email ID"),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: TextFormField(
                          maxLines: 3,
                          maxLength: 300,
                          //initialValue: userr.address,
                          controller: _addresscontroller,
                          decoration: const InputDecoration(
                              hintText: "Enter Address...."),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Mobile',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: _mobilecontroller,
                          //initialValue: userr.moblieno,
                          decoration: const InputDecoration(
                              hintText: "Enter Mobile Number"),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: const Text(
                            'Pin Code',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Container(
                          child: const Text(
                            'State',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        flex: 2,
                      ),
                    ],
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: TextFormField(
                            //initialValue: userr.pincode,
                            controller: _pincontroller,
                            decoration: const InputDecoration(
                                hintText: "Enter Pin Code"),
                          ),
                        ),
                        flex: 2,
                      ),
                      Flexible(
                        child: TextFormField(
                          //initialValue: userr.state,
                          controller: _statecontroller,
                          decoration:
                              const InputDecoration(hintText: "Enter State"),
                        ),
                        flex: 2,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
                buildProgress(uploadTask),
                 const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                    onPressed: () {
                      final image = imageurlpass;
                      final namevar = _namecontroller.text;
                      final addressvar = _addresscontroller.text;
                      final mobilevar = _mobilecontroller.text;
                      final pinvar = _pincontroller.text;
                      final emailvar = _emailcontroller.text;
                      final statevar = _statecontroller.text;
                      if (selectedimage == null) {
                        updateuserdetials(image, namevar, addressvar, mobilevar,
                            pinvar, statevar, emailvar);
                      } else {
                        addimage(namevar, addressvar, mobilevar, pinvar,
                            statevar, emailvar);
                      }
                      //addimage(namevar, addressvar, mobilevar, pinvar, statevar,
                      // emailvar,image);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 128, 255),
                        shape: const StadiumBorder()),
                    child: const Text('Update Profile')),
              ),
              const SizedBox(
                height: 50,
              ),
            
            ],
          ),
        );
      });



  String uidofcc = FirebaseAuth.instance.currentUser!.uid;



  Stream<List<UserDetails>> readUserdetails() => FirebaseFirestore.instance
      .collection('UserDetailsList')
      .where('id', isEqualTo: uidofcc)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => UserDetails.fromJson(doc.data()))
          .toList());



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



  Future addimage(
    String name,
    String address,
    String mobile,
    String pin,
    String state,
    String email,
  ) async {
    final file = File(pickedFile!.path!);
    final path = 'userimage/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshort = await uploadTask!.whenComplete(() {});
    final urldownload = await snapshort.ref.getDownloadURL();
    print('Dounload url : $urldownload');
    updateuserdetials(urldownload, name, address, mobile, pin, state, email);
  }



  Future updateuserdetials(
    String url,
    String name,
    String address,
    String mobile,
    String pin,
    String state,
    String email,
  ) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final userd =
        FirebaseFirestore.instance.collection('UserDetailsList').doc(uid);
    if (url.isEmpty) {
      url = selectedimage.toString();
      return url;
    }
    if (name.isEmpty) {
      return;
    }
    if (address.isEmpty) {
      return;
    }
    if (url.isEmpty) {
      return;
    }
    if (address.isEmpty) {
      return;
    }
    if (mobile.isEmpty) {
      return;
    }
    if (pin.isEmpty) {
      return;
    }
    if (state.isEmpty) {
      return;
    }

    final userdetilaslist = UserDetails(
        id: uid,
        name: name,
        profileimage: url,
        address: address,
        email: email,
        moblieno: mobile,
        pincode: pin,
        state: state);

    //await FirebaseFirestore.instance
    // .collection('UserDetailsList')
    // .doc(uid)
    // .update(userdetilaslist.toJson());
    final json = userdetilaslist.toJson();
    await userd.set(json);
  }
}


 Widget buildProgress(  UploadTask? uploadTask)=> StreamBuilder<TaskSnapshot>(
   stream: uploadTask?.snapshotEvents,
   builder: (context,snap)
   {
      if(snap.hasData){
        final data = snap.data!;
        double progress = data.bytesTransferred/data.totalBytes;
        return  SizedBox(
          height: 50,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20 ,vertical: 10),
                child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: Colors.green,),
              ),
              Center(child: 
              Text('${(100*progress).roundToDouble()}%', 
              style:const  TextStyle(color: Colors.white),),
              )
              ],)
          ,
        );
      }
      else{
    return const  SizedBox(height: 50,);
      }
   });
