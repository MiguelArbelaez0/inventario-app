import 'package:flutter/material.dart';

import '../models/persona_models.dart';

class PersonasProvider extends ChangeNotifier {
  final List<Persona> _personas = [];

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
