import 'package:flutter/material.dart';

import '../data source/local_data_source.dart';
import '../models/persona_models.dart';

// class PersonasProvider extends ChangeNotifier {
//   LocalDataSource localDataSource;

//   List<Persona> _personas = [];

//   List<Persona> get personas => _personas;

//   PersonasProvider(this.localDataSource) {
//     _init();
//   }

//   void _init() async {
//     _personas = await localDataSource.listPersons(personas);
//     notifyListeners();
//   }

//   Future<void> listPersons() async {
//     final List<Persona> lista = await localDataSource.listPersons(_personas);
//     _personas.clear();
//     _personas.addAll(lista);
//     notifyListeners();
//   }

//   Future<bool> guardarPersonas() async {
//     try {
//       await localDataSource.listPersons(_personas);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   void agregarPersona(Persona persona) {
//     _personas.add(persona);
//     notifyListeners();
//   }

//   void eliminarPersona(Persona persona) {
//     _personas.remove(persona);
//     notifyListeners();
//   }

//   void eliminarSeleccionados() {
//     _personas.removeWhere((persona) => persona.seleccionado);
//     notifyListeners();
//   }
// }
class PersonasProvider extends ChangeNotifier {
  LocalDataSource localDataSource;

  List<Persona> _personas = [];

  PersonasProvider(this.localDataSource) {
    _init();
  }

  void _init() async {
    _personas = await localDataSource.listPersons();
    notifyListeners();
  }

  List<Persona> get personas => _personas;

  Future<void> agregarPersona(Persona persona) async {
    _personas.add(persona);
    notifyListeners();
  }

  Future<void> savePersons() async {
    await localDataSource.savePersons(personas);
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
