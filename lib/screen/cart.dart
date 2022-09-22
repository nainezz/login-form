import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../procciders/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Screen')),
      body: Consumer<CartProvider>(
        builder: (context, cartValue, child) => ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: cartValue.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(cartValue.products[index].image),
                  title: Text(cartValue.products[index].title),
                  trailing: Text(
                    '\$ ${cartValue.products[index].price} ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
