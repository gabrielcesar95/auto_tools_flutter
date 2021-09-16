import 'package:auto_tools/pages/home/home_page.dart';
import 'package:auto_tools/providers/fuel_comparer_provider.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FuelComparerProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Tools',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.route,
      routes: routes,
    );
  }
}
