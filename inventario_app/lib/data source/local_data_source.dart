import 'dart:convert';

import '../models/persona_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  Future<List<Persona>> listPersons() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? personString = prefs.getString("persons");

    if (personString == null || personString.isEmpty) {
      return [];
    }

    final Iterable persons = json.decode(personString);
    final result = List<Persona>.from(persons.map((e) => Persona.fromJson(e)));
    return result;
  }

  Future<bool> savePersons(List<Persona> personas) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String personString = json.encode(personas);
    try {
      await prefs.setString("persons", personString);
      return true;
    } catch (e) {
      return false;
    }
  }
}

final LocalDataSource localDataSource = LocalDataSource();
