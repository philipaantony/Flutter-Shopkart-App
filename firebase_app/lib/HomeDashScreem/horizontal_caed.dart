import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 170,
          padding: const EdgeInsets.all(12),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 40,
                    child: const Icon(Icons.logo_dev,size: 40,),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  color:Color.fromARGB(255, 146, 146, 146) ,
                  child: const Text('Part Time',style: TextStyle(color: Colors.white),))
              ],
            ),
            const SizedBox(height: 4,),
            const Text('Discover'),
            const Text('\$ 156')
            ],
            
          ),
        ),
      ),
    );
  }
}