class FuelType {
  String id;
  String title;
  double? price;
  double? consumption;
  bool selected = false;

  FuelType(this.id, this.title, {this.price, this.consumption});

  FuelType.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        consumption = json['consumption'];
}
