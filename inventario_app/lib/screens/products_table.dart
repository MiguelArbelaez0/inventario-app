import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider..dart';
import '../widgets/dialog.dart';

class TablaProductos extends StatelessWidget {
  const TablaProductos({Key? key}) : super(key: key);

  void eliminarSeleccionados(BuildContext context) {
    final productosProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productosProvider.saveProducts();
    productosProvider.removeSelectedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Tabla de Productos'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => eliminarSeleccionados(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<ProductProvider>(
          builder: (context, productosProvider, _) {
            return DataTable(
              columns: [
                DataColumn(label: Text('Seleccionar')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Categoría')), // Nuevo
                DataColumn(label: Text('Precio')),
              ],
              rows: productosProvider.products.map((producto) {
                return DataRow(cells: [
                  DataCell(Checkbox(
                    value: producto.seleccionado,
                    onChanged: (valor) {
                      producto.seleccionado = valor != null ? valor : true;
                      productosProvider.notifyListeners();
                    },
                  )),
                  DataCell(Text(producto.nombre)),
                  DataCell(Text(producto.categoria)),
                  DataCell(Text(producto.precio.toString())),
                ]);
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddProduct(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
