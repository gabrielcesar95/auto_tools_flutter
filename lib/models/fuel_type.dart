class FuelType {
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

  setPrice(String newPrice) {
    String np = newPrice.replaceAll(RegExp(r'[R$ ]'), '');

    np = np.replaceAll(RegExp(r','), '.');

    if (np.isNotEmpty) {
      price = double.parse(np);
    } else {
      price = 0;
    }

    print(price);
  }
}
