// ignore_for_file: dead_code

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:simple_login/model/product.dart';
import 'package:simple_login/procciders/cart.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;
  late num price;

  Future<ProductModel> getProduct() async {
    var response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/${widget.product.id}'));
    final data = jsonDecode(response.body);
    return ProductModel.fromJson(data);
  }

  @override
  void initState() {
    price = widget.product.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              child: Image(
                image: NetworkImage(widget.product.image),
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
                      widget.product.title,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    '\$ $price',
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
              child: Column(
                children: [
                  Text(widget.product.description),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          quantity++;
                          price = quantity * widget.product.price;
                          setState(() {});
                        },
                        icon: const Icon(Icons.add, size: 30),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            quantity--;
                            price -= widget.product.price;
                            setState(() {});
                          }
                        },
                        icon: const Icon(Icons.remove, size: 30),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  if (value.isInCart(widget.product)) {
                    value.removeFromCart(widget.product);
                  } else {
                    value.addToCart(widget.product);
                  }
                },
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Text(value.isInCart(widget.product)
                    ? 'remove from cart'
                    : 'Add to cart'),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
