import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:simple_login/model/product.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  Future<ProductModel> getProduct() async {
    var response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/${product.id}'));

    final data = jsonDecode(response.body);
    return ProductModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: FutureBuilder<ProductModel>(
        future: getProduct(),
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
          final data = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: Image(
                  image: NetworkImage(data.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        data.title,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      '\$ ${data.price}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 24),
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data.description),
              ))
            ],
          );
        },
      ),
    );
  }
}
