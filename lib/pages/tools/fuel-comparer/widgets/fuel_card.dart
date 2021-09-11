import 'package:flutter/material.dart';

class FuelCard extends StatefulWidget {
  const FuelCard(this.fuelType, {Key? key}) : super(key: key);

  final Map fuelType;

  @override
  _FuelCardState createState() => _FuelCardState();
}

class _FuelCardState extends State<FuelCard> {
  late final TextEditingController _priceController =
      TextEditingController(text: widget.fuelType['price'].toString());

  late final TextEditingController _consumptionController =
      TextEditingController(text: widget.fuelType['consumption'].toString());

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                widget.fuelType['title'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Preço',
                hintText: 'R\$ 3,84',
              ),
            ),
            TextFormField(
              controller: _consumptionController,
              decoration: const InputDecoration(
                labelText: 'Consumo',
                hintText: '8,4 Km/L',
              ),
            )
          ],
        ),
      ),
    );
  }
}
