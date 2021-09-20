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
    return Container(
      color: const Color(0xFF737373),
      // height: 240,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Combustível recomendado',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox.fromSize(
                size: const Size.fromHeight(8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
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
        ),
      ),
    );
  }
}
