import 'package:flutter/material.dart';
import 'package:inventario_app/screens/settings_screen.dart';
import 'package:inventario_app/screens/products_table.dart';
import 'package:provider/provider.dart';

import '../provider/nav_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [TablaProductos(), SettingScreen()];
  @override
  Widget build(BuildContext context) {
    final tabModel = Provider.of<NavModelProvider>(context);

    return Scaffold(
      body: _pages[tabModel.selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabModel.selectedTab,
        onTap: (index) {
          tabModel.selectedTab = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_view_rounded),
            label: 'inventario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
