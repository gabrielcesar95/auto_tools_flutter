import 'package:auto_tools/pages/home/main.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/main.dart';
import 'package:flutter/cupertino.dart';

var routes = <String, WidgetBuilder>{
  HomePage.route: (context) => HomePage(),
  FuelComparerPage.route: (context) => const FuelComparerPage(),
};
