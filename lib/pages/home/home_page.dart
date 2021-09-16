import 'widgets/menu_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String route = '/';

  HomePage({Key? key}) : super(key: key);

  final List<MenuItem> menus = [
    const MenuItem(
      name: 'Comparador de Combustíveis',
      icon: Icons.local_gas_station,
      route: 'tools/fuel-comparer',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ferramentas Automotivas'),
      ),
      body: SafeArea(
        child: Center(
          child: GridView.count(crossAxisCount: 2, children: menus),
        ),
      ),
    );
  }
}
