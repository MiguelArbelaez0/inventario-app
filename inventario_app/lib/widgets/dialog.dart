import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/persona_models.dart';
import '../provider/personas_provider.dart';

class AgregarPersona extends StatelessWidget {
  const AgregarPersona({Key? key});

  @override
  Widget build(BuildContext context) {
    final personasProvider =
        Provider.of<PersonasProvider>(context, listen: false);
    final nombreController = TextEditingController();
    final apellidoController = TextEditingController();
    final edadController = TextEditingController();

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: AlertDialog(
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
      ),
    );
  }
}
