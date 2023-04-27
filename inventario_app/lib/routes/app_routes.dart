import 'package:flutter/material.dart';
import 'package:inventario_app/screens/home_screen.dart';
import 'package:inventario_app/screens/register_screen.dart';

import '../screens/login_screen.dart';

class RoutesApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "home":
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case "login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "register":
        return MaterialPageRoute(builder: (_) => RegisterScreen());
    }

    return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
