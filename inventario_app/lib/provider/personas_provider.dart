import 'package:flutter/material.dart';

import '../models/persona_models.dart';

class PersonasProvider extends ChangeNotifier {
  List<Persona> _personas = [
    Persona(nombre: 'Juan', apellido: 'Pérez', edad: 30),
    Persona(nombre: 'María', apellido: 'González', edad: 25),
    Persona(nombre: 'Pedro', apellido: 'Rodríguez', edad: 40),
  ];

  List<Persona> get personas => _personas;

  void agregarPersona(Persona persona) {
    _personas.add(persona);
    notifyListeners();
  }

  void eliminarPersona(Persona persona) {
    _personas.remove(persona);
    notifyListeners();
  }

  void eliminarSeleccionados() {
    _personas.removeWhere((persona) => persona.seleccionado);
    notifyListeners();
  }
}
