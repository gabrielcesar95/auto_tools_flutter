import 'package:cloud_firestore/cloud_firestore.dart';

class FuelType {
  String id;
  String title;
  double? price;
  double? consumption;
  bool selected = false;

  static CollectionReference collection =
      FirebaseFirestore.instance.collection('fuelTypes');

  FuelType(this.id, this.title, {this.price, this.consumption});

  FuelType.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        consumption = json['consumption'];

  static Future<List<FuelType>> find() async {
    QuerySnapshot documents = await collection.get();
    List<FuelType> models = [];

    if (documents.docs.isNotEmpty) {
      documents.docs.forEach((element) {
        Map<String, dynamic> data = {
          'id': element.id,
          ...element.data() as Map<String, dynamic>
        };

        models.add(FuelType.fromMap(data));
      });
    }

    return models;
  }

  double get pricePerLiter {
    if (price != null && consumption != null) {
      return price! / consumption!;
    }
    return 0;
  }

  setPrice(String newPrice) {
    String np = newPrice.replaceAll(RegExp(r'[R$ ]'), '');

    np = np.replaceAll(RegExp(r','), '.');

    if (np.isNotEmpty) {
      price = double.parse(np);
    } else {
      price = null;
    }
  }

  setConsumption(String newConsumption) {
    String nc = newConsumption.replaceAll(RegExp(r'[ Km/l]'), '');

    nc = nc.replaceAll(RegExp(r','), '.');

    if (nc.isNotEmpty) {
      consumption = double.parse(nc);
    } else {
      consumption = null;
    }
  }
}
