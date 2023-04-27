import 'package:flutter/material.dart';
import 'package:inventario_app/screens/products_table.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Inventario',
      'Item 2',
      'Item 3',
      'Item 4',
    ];
    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TablaProductos()),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    items[index],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
