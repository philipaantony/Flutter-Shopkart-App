import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name ;
  final Icon iconnew;
  
   CardWidget({Key? key,required this.name,required this.iconnew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding:const  EdgeInsets.all(20),
          color: const Color.fromARGB(255, 246, 246, 246),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      
                      height: 40,
                      child:  Text(name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 18))),
                  iconnew,
                ],
              ),
              const Text('Discover more here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 14)),
              const Text('10-10-2022',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
