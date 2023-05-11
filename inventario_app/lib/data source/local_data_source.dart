import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';
import '../models/user_data_model.dart';

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

class UserLocalDataSource {
  static const String _currentUserKey = 'currentUser';

  Future<User?> getUser(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(email);

    if (userData == null) {
      return null;
    }

    return User.fromJson(json.decode(userData));
  }

  Future<bool> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(user.email, json.encode(user.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_currentUserKey);

    if (userData == null) {
      return null;
    }

    return User.fromJson(json.decode(userData));
  }

  Future<bool> setCurrentUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(_currentUserKey, json.encode(user.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(_currentUserKey);
      return true;
    } catch (e) {
      return false;
    }
  }
}

final UserLocalDataSource userlocalDataSource = UserLocalDataSource();
