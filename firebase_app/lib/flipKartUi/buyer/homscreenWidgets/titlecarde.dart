import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
final String value;

  const TitleWidget({
    required this.value,
    Key? key,
  }) : super(key: key);
   
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          //height: 35,
          //width: 120,
          color:const Color.fromARGB(255, 29, 30, 63),
          child:  Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          )),
        ),
      ),
    );
  }
}