import 'package:auto_tools/models/fuel_type.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final FuelType fuelType;

  const Results(this.fuelType, {Key? key}) : super(key: key);

  String formatPricePerLiter() {
    return fuelType.pricePerLiter
        .toStringAsFixed(2)
        .replaceAll(RegExp(r'[.]'), ',');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Combustível recomendado',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                fuelType.title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
              Text(
                'Preço por Km: R\$ ${formatPricePerLiter()}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
