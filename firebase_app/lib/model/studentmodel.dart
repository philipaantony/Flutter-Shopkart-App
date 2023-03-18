class Student{
  String id;
  String uid;
  final String student;
  final String age;

  Student({
  this.id = '',
  required this.uid,  
  required this.student,
  required this.age
  });
  

 Map<String, dynamic> toJson() =>
 {
  'id':id,
  'uid':uid,
  'student' : student,
  'age':age,
 } ;


static Student fromJson(Map<String, dynamic> json)=>Student(
  id: json['id'],
  uid:json['uid'],
  student: json['student'],
  age: json['age'],
  );

}

