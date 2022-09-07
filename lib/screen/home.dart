// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:simple_login/model/category.dart';
import 'package:simple_login/model/product.dart';
import 'package:simple_login/screen/profile.dart';

import '../widgets/product.dart';
import 'category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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

  Future<List<ProductModel>> getProducts() async {
    var users = <ProductModel>[];
    var response = await http.get(
      Uri.parse('https://fakestoreapi.com/products?limit=5'),
    );

    final List data = jsonDecode(response.body);
    for (var user in data) {
      users.add(ProductModel.fromJson(user));
    }
    return users;
  }

  Future<List> getCategories() async {
    var response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    final List data = jsonDecode(response.body);

    return data;
  }

  Future<List<ProductModel>> getspecific() async {
    var specifics = <ProductModel>[];
    var response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/electronics'));
    final List data = jsonDecode(response.body);
    for (var specific in data) {
      specifics.add(ProductModel.fromJson(specific));
    }
    return specifics;
  }

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
                  InkResponse(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    },
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/59535592?v=4',
                        ),
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
                child: FutureBuilder<List>(
                    future: getCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      if (!snapshot.hasData) {
                        return Center(child: Text('product not found'));
                      }

                      var data = snapshot.data!;

                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => CategoryScreen(
                                              title: data[index],
                                            ))));
                              },
                              child: Container(
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
                                      '${data[index]} ',
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ]),
                                ),
                              ),
                            )),
                      );
                    }),
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
                      'Electronics',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: FutureBuilder<List<ProductModel>>(
                          future: getspecific(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    snapshot.error.toString(),
                                  ),
                                );
                              }
                            }
                            var data = snapshot.data ?? [];
                            return ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) =>
                                  ProductCard(product: data[index])),
                            );
                          }),
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
                      child: FutureBuilder<List<ProductModel>>(
                          future: getProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  snapshot.error.toString(),
                                ),
                              );
                            }
                            var data = snapshot.data ?? [];
                            return ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) =>
                                    ProductCard(product: data[index])));
                          }),
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
