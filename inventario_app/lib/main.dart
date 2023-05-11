import 'package:flutter/material.dart';
import 'package:inventario_app/data%20source/local_data_source.dart';

import 'package:inventario_app/provider/nav_provider.dart';
import 'package:inventario_app/provider/product_provider..dart';
import 'package:inventario_app/provider/auth_provider.dart';
import 'package:inventario_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LocalDataSource localDataSource = LocalDataSource();

  final UserLocalDataSource userlocalDataSource = UserLocalDataSource();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(localDataSource),
        ),
        ChangeNotifierProvider<NavModelProvider>(
          create: (_) => NavModelProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(userlocalDataSource),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RoutesApp.generateRoute,
      ),
    );
  }
}
