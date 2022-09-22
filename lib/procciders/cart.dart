import 'package:flutter/material.dart';
import 'package:simple_login/model/product.dart';

class CartProvider with ChangeNotifier {
  List<ProductModel> products = [];

  void addToCart(ProductModel product) {
    products.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    products.remove(product);
    notifyListeners();
  }

  bool isInCart(ProductModel product) => products.contains(product);
}
