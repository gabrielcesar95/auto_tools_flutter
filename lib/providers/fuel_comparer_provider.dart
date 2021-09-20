import 'dart:collection';

import 'package:auto_tools/models/fuel_type.dart';
import 'package:flutter/cupertino.dart';

class FuelComparerProvider with ChangeNotifier {
  List<FuelType> _fuelTypes = [];

  UnmodifiableListView<FuelType> get fuelTypes =>
      UnmodifiableListView(_fuelTypes);

  saveAll(List<FuelType> fuelTypes) {
    _fuelTypes = fuelTypes;

    notifyListeners();
  }
}
