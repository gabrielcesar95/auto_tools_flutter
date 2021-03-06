import 'package:auto_tools/models/fuel_type.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuelCard extends StatefulWidget {
  const FuelCard(this.fuelType, {Key? key}) : super(key: key);

  final FuelType fuelType;

  @override
  _FuelCardState createState() => _FuelCardState();
}

class _FuelCardState extends State<FuelCard> {
  late final TextEditingController _priceController =
      TextEditingController(text: widget.fuelType.price?.toString());

  late final TextEditingController _consumptionController =
      TextEditingController(text: widget.fuelType.consumption?.toString());

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
                widget.fuelType.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            TextFormField(
              controller: _priceController,
              inputFormatters: [
                TextInputMask(
                  mask: 'R\$! 9,99',
                )
              ],
              decoration: const InputDecoration(
                labelText: 'Preço',
                hintText: 'R\$ 3,84',
              ),
              onChanged: (value) {
                widget.fuelType.setPrice(value);
              },
            ),
            TextFormField(
              controller: _consumptionController,
              inputFormatters: [
                TextInputMask(
                  mask: '99,99 !K!m!/!l!',
                )
              ],
              decoration: const InputDecoration(
                labelText: 'Consumo',
                hintText: '8,4 Km/L',
              ),
              onChanged: (value) {
                widget.fuelType.setConsumption(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
