import 'package:flutter/material.dart';

class ShopKartSerachBar extends StatelessWidget {
  const ShopKartSerachBar({
    Key? key,
    required this.outlineInputBorder,
  }) : super(key: key);

  final OutlineInputBorder outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Serach items...',
            fillColor:const Color.fromARGB(153, 209, 209, 209),
            filled: true,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            prefixIcon:const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }}