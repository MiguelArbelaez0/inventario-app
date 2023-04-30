import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventario_app/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  AuthProvider() {
    _init();
  }

  User? get user => _user;

  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final userData = prefs.getString(email);

    if (userData != null) {
      final user = User.fromJson(json.decode(userData));

      if (user.password == password) {
        _user = user;
        notifyListeners();
        return true;
      }
    }

    return false;
  }

  Future<bool> register(
      String firstName, String lastName, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final userData = prefs.getString(email);

    if (userData != null) {
      return false; // el usuario ya existe
    }

    final user = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    await prefs.setString(email, json.encode(user.toJson()));

    _user = user;
    notifyListeners();
    return true; // registro exitoso
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }

  void _init() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('currentUser');

    if (userData != null) {
      _user = User.fromJson(json.decode(userData));
    }
  }
}
