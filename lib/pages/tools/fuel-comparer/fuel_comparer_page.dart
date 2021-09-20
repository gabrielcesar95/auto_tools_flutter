import 'package:auto_tools/models/fuel_type.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/widgets/fuel_card.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/widgets/fuel_chip.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/widgets/results.dart';
import 'package:flutter/material.dart';

class FuelComparerPage extends StatefulWidget {
  static String route = 'tools/fuel-comparer';

  const FuelComparerPage({Key? key}) : super(key: key);

  @override
  State<FuelComparerPage> createState() => _FuelComparerPageState();
}

class _FuelComparerPageState extends State<FuelComparerPage> {
  // TODO: get fuelTypes form firebase
  final List<Map<String, dynamic>> fuelTypes_backend = [
    {
      'id': 'abc123',
      'title': 'Etanol',
      'selected': false,
    },
    {
      'id': 'xyz789',
      'title': 'Gasolina',
      'selected': false,
    }
  ];

  List<FuelType> fuelTypes = [];

  @override
  void initState() {
    super.initState();

    fuelTypes = fuelTypes_backend.map((ft) => FuelType.fromMap(ft)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador de Combustíveis'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Wrap(
                  spacing: 8,
                  children: fuelTypes
                      .map(
                        (ft) => FuelChip(ft, onSelected: (selected) {
                          setState(() {
                            ft.selected = selected;
                          });
                        }),
                      )
                      .toList(),
                ),
              ),
              SizedBox.fromSize(
                size: const Size.fromHeight(8),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: fuelTypes
                      .where((ft) => ft.selected)
                      .map((sft) => FuelCard(
                            sft,
                            key: Key(sft.id),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ac_unit),
        onPressed: () => _compareFuelTypes(),
      ),
    );
  }

  _compareFuelTypes() {
    FuelType cheaperFuelType;

    List<FuelType> selectedTypes =
        fuelTypes.where((ft) => ft.selected).toList();

    cheaperFuelType = selectedTypes.reduce((value, element) =>
        value.pricePerLiter < element.pricePerLiter ? value : element);

    _showModal(cheaperFuelType);
  }

  _showModal(FuelType result) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Results(result),
    );
  }
}
