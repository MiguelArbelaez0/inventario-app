import 'package:flutter/material.dart';

import '../data source/local_data_source.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  LocalDataSource localDataSource;

  List<Product> _products = [];

  ProductProvider(this.localDataSource) {
    _init();
  }

  void _init() async {
    _products = await localDataSource.listProducts();
    notifyListeners();
  }

  List<Product> get products => _products;

  Future<void> addProduct(Product product) async {
    _products.add(product);
    notifyListeners();
  }

  Future<void> saveProducts() async {
    await localDataSource.saveProducts(_products);
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void removeSelectedProducts() {
    _products.removeWhere((product) => product.seleccionado);
    notifyListeners();
  }
}
