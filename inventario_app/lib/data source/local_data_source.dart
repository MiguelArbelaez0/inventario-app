import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

class LocalDataSource {
  Future<List<Product>> listProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? productString = prefs.getString("products");

    if (productString == null || productString.isEmpty) {
      return [];
    }

    final Iterable products = json.decode(productString);
    final result = List<Product>.from(products.map((e) => Product.fromJson(e)));
    return result;
  }

  Future<bool> saveProducts(List<Product> products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String productString = json.encode(products);
    try {
      await prefs.setString("products", productString);
      return true;
    } catch (e) {
      return false;
    }
  }
}

final LocalDataSource localDataSource = LocalDataSource();
