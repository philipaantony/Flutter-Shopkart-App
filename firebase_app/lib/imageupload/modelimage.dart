
class ImageList {
  final String imageURL;
  


  ImageList(
      {
      
      required this.imageURL,
});
      

 Map<String, dynamic> toJson() =>
 {
  'imageURL':imageURL,
 
 };  

static ImageList fromJson(Map<String, dynamic> json)=>ImageList
(
  imageURL: json['imageURL'],
  );}