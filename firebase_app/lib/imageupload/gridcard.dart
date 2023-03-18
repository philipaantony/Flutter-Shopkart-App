import 'package:flutter/material.dart';


class GrideCard extends StatelessWidget {
   const GrideCard({
     Key? key ,
     required this.imageList 
     }) : super(key: key);

    final imageList;

  @override
  Widget build(BuildContext context) {
  
      return  Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
              decoration:
                   BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageList)
                      )
                      ),
            
    ),
    
      );
      
  }
}