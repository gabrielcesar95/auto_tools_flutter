import 'package:flutter/cupertino.dart';

class FuelComparerProvider with ChangeNotifier {
  int count = 0;

  add() {
    print('add');
    count++;

    notifyListeners();
  }

  subtract() {
    count--;
  }
}
