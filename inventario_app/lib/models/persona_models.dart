class Persona {
  final String nombre;
  final String apellido;
  final int edad;
  bool seleccionado;

  Persona({
    required this.nombre,
    required this.apellido,
    required this.edad,
    this.seleccionado = false,
  });

  static Persona fromJson(Map<String, dynamic> json) {
    return Persona(
      nombre: json['nombre'],
      apellido: json['apellido'],
      edad: json['edad'],
      seleccionado: json['seleccionado'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'edad': edad,
      'seleccionado': seleccionado,
    };
  }
}
