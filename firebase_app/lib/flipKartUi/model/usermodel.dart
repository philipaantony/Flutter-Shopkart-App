import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails
{
String id;
final String name;
final String profileimage;
final String email;
final String address;
final String moblieno;
final String pincode;
final String state;


UserDetails({
     this.id= '',
     required this.name,
     required this.profileimage,
     required this.address,
     required this.email,
     required this.moblieno,
     required this.pincode,
     required this.state
     });


Map<String, dynamic> toJson() =>
 {
  'id':id,
  'name':name,
  'profileimage':profileimage,
  'email' : email,
  'address' : address,
  'moblieno':moblieno,
  'pincode':pincode,
  'state':state,
 } ;


static UserDetails fromJson(Map<String, dynamic> json)=>UserDetails(
  id: json['id'],
  name:json['name'],
  profileimage:json['profileimage'],
  email: json['email'],
  address: json['address'],
  moblieno: json['moblieno'],
  state: json['state'],
  pincode: json['pincode'],
  );

 

}

  
