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
              final newProduct = Product(
                  nombre: name, descripcion: description, precio: price);
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
