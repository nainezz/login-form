// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../screen/detials.dart';
import 'package:http/http.dart' as http;

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductScreen(product: product)));
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          width: 180,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(product['image']),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Text(
                            '${product["title"]}  ',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${product["description"]}   ',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.orange.withOpacity(0.2),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              child: Text(
                                'Promo',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '\$ ${product["price"]}',
                                style: TextStyle(color: Colors.blue),
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
        ),
      ),
    );
  }
}
