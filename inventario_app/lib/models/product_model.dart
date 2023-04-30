class Product {
  final String nombre;
  final String descripcion;
  final double precio;
  final String categoria;
  bool seleccionado;

  Product({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.categoria,
    this.seleccionado = false,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      categoria: json['categoria'],
      seleccionado: json['seleccionado'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
      'seleccionado': seleccionado,
    };
  }
}
