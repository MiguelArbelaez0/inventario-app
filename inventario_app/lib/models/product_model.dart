class Product {
  final String nombre;
  final String descripcion;
  final double precio;
  bool seleccionado;

  Product({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    this.seleccionado = false,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      seleccionado: json['seleccionado'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'seleccionado': seleccionado,
    };
  }
}
