

class UserDetials{
  String id;
  String uid;
  final String username;
  final String email;


  UserDetials({
    this.id = '',
    required this.uid, 
    required this.email,
    required this.username});



 Map<String, dynamic> toJson() =>
 {
  'id':id,
  'uid':uid,
  'username':username,
  'email':email,
 };  

static UserDetials fromJson(Map<String, dynamic> json)=>UserDetials
(
  id: json['id'],
  uid:json['uid'],
  username: json['username'],
  email: json['email']
  );




}