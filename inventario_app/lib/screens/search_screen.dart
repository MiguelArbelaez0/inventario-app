import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider..dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar producto'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    productProvider.setSearchTerm('');
                  },
                ),
              ),
              onChanged: (value) {
                productProvider.setSearchTerm(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];

                return ListTile(
                  title: Text(product.nombre),
                  subtitle: Text(product.precio.toString()),
                  onTap: () {
                    // Navegar a la pantalla de detalles del producto
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
