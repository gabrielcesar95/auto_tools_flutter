import 'package:auto_tools/pages/home/home_page.dart';
import 'package:auto_tools/providers/fuel_comparer_provider.dart';
import 'package:auto_tools/view_models/fuel_type.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    // TODO: Remove unused providers
    providers: [
      ChangeNotifierProvider(create: (_) => FuelComparerProvider()),
    ],
    child: const App(),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      debugPrint(e.toString());
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return const Center(
        child: Text('Falha ao iniciar firebase'),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return const CircularProgressIndicator();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FuelTypeViewModel()),
      ],
      child: MaterialApp(
        title: 'Auto Tools',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.route,
        routes: routes,
      ),
    );
  }
}
