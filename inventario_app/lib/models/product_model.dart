class Product {
  final String nombre;
  final double precio;
  final String categoria;
  bool seleccionado;

  Product({
    required this.nombre,
    required this.precio,
    required this.categoria,
    this.seleccionado = false,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      nombre: json['nombre'],
      precio: json['precio'],
      categoria: json['categoria'],
      seleccionado: json['seleccionado'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'precio': precio,
      'categoria': categoria,
      'seleccionado': seleccionado,
    };
  }
}
