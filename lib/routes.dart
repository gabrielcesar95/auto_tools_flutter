import 'package:auto_tools/pages/home/home_page.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/fuel_comparer_page.dart';
import 'package:flutter/cupertino.dart';

var routes = <String, WidgetBuilder>{
  HomePage.route: (context) => HomePage(),
  FuelComparerPage.route: (context) => const FuelComparerPage(),
};
