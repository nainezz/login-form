import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_login/widgets/product.dart';
import 'package:http/http.dart' as http;

class CategoryScreen extends StatelessWidget {
  final String title;
  const CategoryScreen({super.key, required this.title});

  Future<List> getProducts() async {
    var response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$title'));

    final List data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.toUpperCase(),
        ),
      ),
      body: FutureBuilder<List>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final List data = snapshot.data ?? [];
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) => ProductCard(product: data[index]),
          );
        },
      ),
    );
  }
}
