import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/persona_models.dart';
import '../provider/personas_provider.dart';
import '../widgets/dialog.dart';

class TablaPersonas extends StatelessWidget {
  const TablaPersonas({Key? key});

  void eliminarSeleccionados(BuildContext context) {
    final personasProvider =
        Provider.of<PersonasProvider>(context, listen: false);
    personasProvider.eliminarSeleccionados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla de Personas'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => eliminarSeleccionados(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<PersonasProvider>(
          builder: (context, personasProvider, _) {
            return DataTable(
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AgregarPersona(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
