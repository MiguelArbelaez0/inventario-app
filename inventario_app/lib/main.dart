import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventario_app/provider/personas_provider.dart';
import 'package:provider/provider.dart';

import 'models/persona_models.dart';
import 'screens/tabla_personas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonasProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Tabla de personas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TablaPersonas(),
      ),
    );
  }
}
