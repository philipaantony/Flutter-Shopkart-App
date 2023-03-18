
class NoteApp {
  final String id;
  final String uid;
  final String title;
  final String content;

  NoteApp(
      {
      this.id = '',
      required this.uid,
      required this.title,
      required this.content});
      

 Map<String, dynamic> toJson() =>
 {
  'id':id,
  'uid':uid,
  'title':title,
  'content':content,
 };  

static NoteApp fromJson(Map<String, dynamic> json)=>NoteApp
(
  id: json['id'],
  uid:json['uid'],
  title: json['title'],
  content: json['content']
  );
   

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {

//         Navigator.of(context)
//                   .pushReplacement(MaterialPageRoute(builder: (ctx) {
//                 return  ScreenAddNote();
//               }));
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey)),
//         padding: const EdgeInsets.all(5),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     title,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),IconButton(
//                   onPressed: (){},
//                   icon:const Icon(Icons.delete),color: Colors.red,)
//               ],
//             ),
//             Text(content,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(color: Colors.black,fontSize: 14),)
//           ],
//         ),
//       ),
//     );
//   }
// }
}