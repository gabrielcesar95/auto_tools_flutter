import 'package:flutter/cupertino.dart';

class FuelType extends ChangeNotifier {
  String id;
  String title;
  double price;
  double? consumption;
  bool selected = false;

  FuelType(this.id, this.title, {this.price = 0, this.consumption});

  FuelType.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'] ?? 0,
        consumption = json['consumption'];
}
