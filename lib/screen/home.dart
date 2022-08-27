// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> images = [
    'https://media1.popsugar-assets.com/files/thumbor/r-H2D7LclaSMDAoEV9iBbODdRJs/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2022/07/27/995/n/1922729/8d82874962e1c1ce7992d1.75767700_/i/best-nike-training-shoes.jpg',
    'https://media.wired.com/photos/5c3d3d3edd72b32c56117f5c/1:1/w_1602,h_1602,c_limit/nike-extended.gif',
    'https://static01.nyt.com/images/2022/03/17/us/08xpsatan-shoe/merlin_186039729_cdb846bf-dc3f-49cf-8552-e3992140338b-superJumbo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4nQ7v4v1Y_Z2MLNHsY6bvbBERB_0yNOHbSw&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              //appbar
              Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/59535592?v=4',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_bag),
                    splashRadius: 24,
                  )
                ],
              ),
              SizedBox(height: 20),
              //carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 300),
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
              //categories
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 64,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        width: 100,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Icon(Icons.image),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                                child: Text(
                              'setting ',
                              overflow: TextOverflow.ellipsis,
                            )),
                          ]),
                        ),
                      )),
                ),
              ),
              //latest products
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Super hot promo',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Image.network(images.first),
                                  SizedBox(height: 5),
                                  Expanded(
                                    child: Text(
                                      'SmartWatch ',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                      child: RichText(
                                    text: TextSpan(text: '\$999'),
                                  ))
                                ]),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
