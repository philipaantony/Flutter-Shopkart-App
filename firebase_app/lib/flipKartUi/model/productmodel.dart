class Product{
  String id;
  final String name;
  final String details;
  final String streamtype;
  final String discription;
  final String seller;
  final String imageurl;
  final String orginalprice;
  final String discountprice;
  final String offpersentage;

  Product({
  this.id = '',
  required this.name,  
  required this.discription,
  required this.streamtype,
  required this.details,
  required this.seller,
  required this.imageurl,
  required this.orginalprice,
  required this.discountprice,
  required this.offpersentage
  });
  

 Map<String, dynamic> toJson() =>
 {
  'id':id,
  'name':name,
  'discription' : discription,
  'details' : details,
  'streamtype':streamtype,
  'imageurl':imageurl,
  'seller':seller,
  'orginalprice':orginalprice,
  'discountprice':discountprice,
  'offpersentage':offpersentage,
 } ;


static Product fromJson(Map<String, dynamic> json)=>Product(
  id: json['id'],
  name:json['name'],
  discription: json['discription'],
  streamtype: json['streamtype'],
  details: json['details'],
  seller: json['seller'],
  imageurl: json['imageurl'],
  orginalprice: json['orginalprice'],
  discountprice: json['discountprice'],
  offpersentage: json['offpersentage'],
  );

}

