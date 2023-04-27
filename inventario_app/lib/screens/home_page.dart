import 'package:flutter/material.dart';
import 'package:inventario_app/screens/tabla_personas.dart';
import 'package:provider/provider.dart';

import '../provider/nav_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [TablaPersonas()];
  @override
  Widget build(BuildContext context) {
    final tabModel = Provider.of<NavModel>(context);

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
