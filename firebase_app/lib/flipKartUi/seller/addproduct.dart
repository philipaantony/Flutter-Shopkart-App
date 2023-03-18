import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_app/flipKartUi/model/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  

  final _nameController = TextEditingController();
 // final _disController = TextEditingController();
  final _sellerController = TextEditingController();
  final _orginalpriceController = TextEditingController();
  final _discountpriceController = TextEditingController();
  final _detailsController = TextEditingController();
  // final _offpersentageController = TextEditingController();
  @override

  // ignore: override_on_non_overriding_member
  String fileselecterindicator = 'Image Preview will shown here';
  // ignore: avoid_init_to_null
  Image? selectedimage = null;

    String dropdownselectedvalue = 'Smart Phone'; 
    var items = [   
    'Smart Phone',
    'TV',
    'Head Phone',
    'Shoes',
    'Laptop',
     'AC',
    'Smart Watch',
     'Bag',
    'dress',
  ]; 

  String streamselectedvalue = 'Popular'; 
      var streamlist = [   
    //'Normal',
    'Trending',
    //'Best Deal',
    'Popular',
   
  ]; 
  


  Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product Name',
                ),
              ),
              const SizedBox(height: 15),



              // TextFormField(
              //   controller: _disController,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: 'Enter Catergory',
              //   ),
              // ),
            Row(
              children: [
                const Text("  Select Category  : " ,style: TextStyle(fontSize: 20),),
                SizedBox(
                  width: 120,
                  child: DropdownButton(
                    
                    icon: const Icon(Icons.keyboard_arrow_down),
                   iconSize: 20,
                                elevation: 30,
                               
                                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                dropdownColor: Color.fromARGB(255, 224, 224, 224),
                                underline: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                  ),
                              ),
                    value: dropdownselectedvalue,      
                    //icon: const Icon(Icons.keyboard_arrow_down),   
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        
                        dropdownselectedvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
           const SizedBox(height: 15,),
            Row(
              children: [
                const Text("  Stream Type  : " ,style: TextStyle(fontSize: 20),),
                SizedBox(
                  width: 120,
                  child: DropdownButton(
                    
                    icon: const Icon(Icons.keyboard_arrow_down),
                   iconSize: 20,
                                elevation: 30,
                               
                                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                dropdownColor: const Color.fromARGB(255, 224, 224, 224),
                                underline: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                  ),
                              ),
                    value: streamselectedvalue,      
                 
                    items: streamlist.map((String streamlist) {
                      return DropdownMenuItem(
                        value: streamlist,
                        child: Text(streamlist),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        
                        streamselectedvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),





              
              const SizedBox(height: 15),
               TextFormField(
              controller: _detailsController,
              maxLines: 10,
              maxLength: 500,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                   hintText: 'Enter details here....!'),
            ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _sellerController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Seller Name',
                ),
              ),
              const SizedBox(height: 15),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: selectFile,
                          child: const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child:  Text('Select \nProduct \nImage'),
                          )),

                      const SizedBox(width: 10,) ,
                        const SizedBox(height: 15),
                      SizedBox(
                         height: 50,
                          width: 50,
                          child: 
                         selectedimage),
                      const SizedBox(
                       width: 5,
                      ),
                      Expanded(child: Text(fileselecterindicator))   
                    ],
                  ),
                
                     // Text(pickedFile!.name),
                 
              
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _orginalpriceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Orginal Price',
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                 keyboardType: TextInputType.number,
                controller: _discountpriceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Discount Price',
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    addimage();
                  },
                  child: const Text('Add Product')),
            ],
          ),
        )),
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
       fileselecterindicator = pickedFile!.name;
       selectedimage =Image.file(
                            File(pickedFile!.path!),
                          );
    });
  }


  Future addimage() async {
    final file = File(pickedFile!.path!);
    final path = 'productimage/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshort = await uploadTask!.whenComplete(() {});
    final urldownload = await snapshort.ref.getDownloadURL();
    print('Dounload url : $urldownload');
    addproduct(urldownload);
  }

  Future addproduct(String url) async {
    final productn = FirebaseFirestore.instance.collection('Product').doc();
    if (_nameController.text.isEmpty) {
      return;
    }
    if (dropdownselectedvalue.isEmpty) {
      return;
    }
    if (_sellerController.text.isEmpty) {
      return;
    }
    if (_orginalpriceController.text.isEmpty) {
      return;
    }
    if (_discountpriceController.text.isEmpty) {
      return;
    }

     int org = int.parse(_orginalpriceController.text);
     int discount = int.parse(_discountpriceController.text);
     int newdata = (org - discount);
     int finaldata = (newdata/org*100).toInt();

    final productlist = Product(
        id: productn.id,
        name: _nameController.text,
        discription: dropdownselectedvalue,
        seller: _sellerController.text,
        details: _detailsController.text,
        streamtype: streamselectedvalue,
        imageurl: url,
        orginalprice: _orginalpriceController.text,
        discountprice: _discountpriceController.text,
        offpersentage: finaldata.toString());

    final json = productlist.toJson();
    await productn.set(json);
  }
}
