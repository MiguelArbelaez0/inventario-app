import 'package:flutter/material.dart';

import '../data source/local_data_source.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  LocalDataSource localDataSource;

  List<Product> _products = [];
  String _searchTerm = '';

  ProductProvider(this.localDataSource) {
    _init();
  }

  void _init() async {
    _products = await localDataSource.listProducts();
    notifyListeners();
  }

  List<Product> get products {
    if (_searchTerm.isEmpty) {
      return _products;
    } else {
      return _products
          .where((product) =>
              product.nombre.toLowerCase().contains(_searchTerm.toLowerCase()))
          .toList();
    }
  }

  String get searchTerm => _searchTerm;

  void setSearchTerm(String term) {
    _searchTerm = term;
    notifyListeners();
  }

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
