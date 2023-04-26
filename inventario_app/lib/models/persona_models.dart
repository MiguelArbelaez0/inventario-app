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
}
