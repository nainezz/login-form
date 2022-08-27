// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  final List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    //'https://media.wired.com/photos/5c3d3d3edd72b32c56117f5c/1:1/w_1602,h_1602,c_limit/nike-extended.gif',
    //'https://static01.nyt.com/images/2022/03/17/us/08xpsatan-shoe/merlin_186039729_cdb846bf-dc3f-49cf-8552-e3992140338b-superJumbo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSek_I3vv8kiCevm833ox1o8vDZpKrBilV2kg&usqp=CAU',
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
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(images.first),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'SmartWatch  ',
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'gadget   ',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.orange
                                                        .withOpacity(0.2),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 6),
                                                  child: Text(
                                                    'Promo',
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: '\$999',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //lastet
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Latest Super hot promo',
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
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(images.first),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'SmartWatch  ',
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'gadget   ',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Colors.orange
                                                        .withOpacity(0.2),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 6),
                                                  child: Text(
                                                    'Promo',
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: '\$999',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
