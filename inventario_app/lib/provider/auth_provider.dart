import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventario_app/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data source/local_data_source.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  UserLocalDataSource userlocalDataSource;

  AuthProvider(this.userlocalDataSource) {
    _init();
  }

  User? get user => _user;

  Future<bool> login(String email, String password) async {
    final user = await userlocalDataSource.getUser(email);

    if (user != null && user.password == password) {
      _user = user;
      notifyListeners();
      await userlocalDataSource.setCurrentUser(user);
      return true;
    }

    return false;
  }

  Future<bool> register(
      String firstName, String lastName, String email, String password) async {
    final existingUser = await userlocalDataSource.getUser(email);

    if (existingUser != null) {
      return false; // el usuario ya existe
    }

    final user = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    await userlocalDataSource.saveUser(user);

    _user = user;
    notifyListeners();
    return true; // registro exitoso
  }

  Future<void> logout() async {
    _user = null;
    await userlocalDataSource.removeCurrentUser();
    notifyListeners();
  }

  void _init() async {
    final user = await userlocalDataSource.getCurrentUser();

    if (user != null) {
      _user = user;
      notifyListeners();
    }
  }
}
