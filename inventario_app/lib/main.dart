import 'package:flutter/material.dart';
import 'package:inventario_app/data%20source/local_data_source.dart';

import 'package:inventario_app/provider/nav_provider.dart';
import 'package:inventario_app/provider/product_provider..dart';
import 'package:inventario_app/provider/auth_provider.dart';
import 'package:inventario_app/routes/app_routes.dart';
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
          create: (context) => ProductProvider(localDataSource),
        ),
        ChangeNotifierProvider(
          create: (context) => NavModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Tabla de personas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RoutesApp.generateRoute,
      ),
    );
  }
}
