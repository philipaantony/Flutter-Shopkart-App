import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget 
{
 const UploadImage({ Key? key }) : super(key: key);
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  PlatformFile? pickedFile;
  UploadTask? uploadTask;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImageUploader')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(pickedFile != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color:const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(File(pickedFile!.path!),
                      width: double.infinity,
                      fit: BoxFit.cover,),
                      Text(pickedFile!.name)
                    ],
                  ),
                  ),
              )
                ),
                 const  SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: selectFile, child: const Text('Select image')),
                const  SizedBox(width: 32,),
                ElevatedButton(onPressed: uploadFile, child: const Text('Upload image')),
              ],
            ),
            const  SizedBox(height: 32,),
            buildProgress(),
            const  SizedBox(height: 50),

          ],
        ),
      ),
      
    );
  }
 Widget buildProgress()=> StreamBuilder<TaskSnapshot>(
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
 

Future selectFile() async
 {
  final result = await FilePicker.platform.pickFiles();
  if(result == null) return;
  
  setState(() {
    pickedFile = result.files.first;
  });
}


 Future uploadFile() async
 {
   final file = File(pickedFile!.path!);
   final path = 'file/${pickedFile!.name}';

   final ref = FirebaseStorage.instance.ref().child(path);
   setState(() 
   {
       uploadTask = ref.putFile(file);
   });
 
   final snapshort = await uploadTask!.whenComplete((){});
   final urldownload = await snapshort.ref.getDownloadURL();
   print('Dounload url : $urldownload');
   
   FirebaseFirestore.instance.collection('ImageUrl').doc().set({'imageURL': urldownload});

 setState(()
  {
   uploadTask = null;
 });
   
 }

}



