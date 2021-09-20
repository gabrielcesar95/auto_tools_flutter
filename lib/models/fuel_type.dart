class FuelType {
  String id;
  String title;
  double? price;
  double? consumption;
  bool selected = false;

  double get pricePerLiter {
    if (price != null && consumption != null) {
      return price! / consumption!;
    }
    return 0;
  }

  FuelType(this.id, this.title, {this.price, this.consumption});

  FuelType.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        consumption = json['consumption'];

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
