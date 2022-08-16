// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(children: [
          Container(
            height: 46,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ]),
      ),
    );
  }
}
