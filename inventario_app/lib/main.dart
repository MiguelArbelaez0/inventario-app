import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inventario_app/provider/personas_provider.dart';
import 'package:provider/provider.dart';

import 'models/persona_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabla de personas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PersonasProvider(),
        child: PantallaPrincipal(),
      ),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TablaPersonas(),
    );
  }
}

class TablaPersonas extends StatelessWidget {
  void eliminarSeleccionados(BuildContext context) {
    final personasProvider =
        Provider.of<PersonasProvider>(context, listen: false);
    personasProvider.eliminarSeleccionados();
  }

  Future<void> agregarPersona(BuildContext context) async {
    final personasProvider =
        Provider.of<PersonasProvider>(context, listen: false);
    final nombreController = TextEditingController();
    final apellidoController = TextEditingController();
    final edadController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar persona'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextField(
                controller: edadController,
                decoration: InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                final nombre = nombreController.text;
                final apellido = apellidoController.text;
                final edad = int.tryParse(edadController.text) ?? 0;
                final nuevaPersona =
                    Persona(nombre: nombre, apellido: apellido, edad: edad);
                personasProvider.agregarPersona(nuevaPersona);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonasProvider>(
      builder: (context, personasProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tabla de Personas'),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => agregarPersona(context),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => eliminarSeleccionados(context),
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Seleccionar')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Apellido')),
                DataColumn(label: Text('Edad')),
              ],
              rows: personasProvider.personas.map((persona) {
                return DataRow(cells: [
                  DataCell(Checkbox(
                    value: persona.seleccionado,
                    onChanged: (valor) {
                      persona.seleccionado = valor != null ? valor : true;
                      personasProvider.notifyListeners();
                    },
                  )),
                  DataCell(Text(persona.nombre)),
                  DataCell(Text(persona.apellido)),
                  DataCell(Text(persona.edad.toString())),
                ]);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
