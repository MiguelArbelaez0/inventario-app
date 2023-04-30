import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/product_provider..dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();

    // Aquí definimos la lista de opciones para la categoría
    final List<String> categoryOptions = ['Comida', 'Bebida', 'Postre'];

    // Esta es la variable que almacenará la selección del usuario
    String? selectedCategory;

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: AlertDialog(
        title: Text('Agregar Producto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            // Aquí agregamos el DropdownButtonFormField
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(labelText: 'Categoría'),
              items: categoryOptions
                  .map((category) => DropdownMenuItem(
                        child: Text(category),
                        value: category,
                      ))
                  .toList(),
              onChanged: (value) {
                selectedCategory = value;
              },
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
            onPressed: () async {
              final name = nameController.text;
              final description = descriptionController.text;
              final price = double.tryParse(priceController.text) ?? 0;

              // Aquí creamos el nuevo producto con la categoría seleccionada
              final newProduct = Product(
                nombre: name,
                descripcion: description,
                precio: price,
                categoria: selectedCategory!, // Nueva propiedad
              );

              productProvider.addProduct(newProduct);
              await productProvider.saveProducts();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
