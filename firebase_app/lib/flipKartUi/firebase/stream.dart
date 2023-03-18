 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/flipKartUi/model/productmodel.dart';
import 'package:firebase_app/flipKartUi/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';




String uidofcc = FirebaseAuth.instance.currentUser!.uid;
  Stream<List<UserDetails>> readUserdetails() => FirebaseFirestore.instance
      .collection('UserDetailsList')
      .where('id', isEqualTo: uidofcc)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => UserDetails.fromJson(doc.data()))
          .toList());

Stream<List<Product>> readUser() => FirebaseFirestore.instance
      .collection('Product')
      .where('streamtype' , isEqualTo: 'Trending' )
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());



Stream<List<Product>> readallproducr() => FirebaseFirestore.instance
      .collection('Product')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());



Stream<List<Product>> readProduct() => FirebaseFirestore.instance
      .collection('Product')
      .where('streamtype' , isEqualTo: 'Popular' )
      //.where('streamtype',whereIn: ['Popular','Trending'])
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());          