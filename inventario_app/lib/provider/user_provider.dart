import 'package:flutter/material.dart';
import 'package:inventario_app/models/user_data_model.dart';

class UserProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  void registerUser({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) {
    _user = User(
      name: name,
      lastName: lastName,
      email: email,
      password: password,
    );
    notifyListeners();
  }

  bool loginUser({required String email, required String password}) {
    if (_user.email == email && _user.password == password) {
      return true;
    }
    return false;
  }
}
