import 'package:auto_tools/models/fuel_type.dart';
import 'package:flutter/material.dart';

class FuelTypeViewModel with ChangeNotifier {
  List<FuelType> _fuelTypes = [];

  List<FuelType> get fuelTypes {
    return _fuelTypes;
  }

  void setFuelTypes(List<FuelType> fuelTypes) {
    _fuelTypes = fuelTypes;
  }

  void setSelected(FuelType fuelType) {
    FuelType subject =
        _fuelTypes.firstWhere((element) => element.id == fuelType.id);

    subject.toggle();

    notifyListeners();
  }
}
