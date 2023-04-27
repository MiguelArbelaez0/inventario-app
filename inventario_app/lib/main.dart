import 'package:flutter/material.dart';

import 'package:inventario_app/provider/nav_provider.dart';
import 'package:inventario_app/provider/personas_provider.dart';
import 'package:inventario_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavModel(),
        ),
      ],
      child: MaterialApp(
          title: 'Tabla de personas',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen()),
    );
  }
}
