import 'package:auto_tools/models/fuel_type.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/widgets/fuel_card.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/widgets/fuel_chip.dart';
import 'package:auto_tools/pages/tools/fuel-comparer/widgets/results.dart';
import 'package:auto_tools/shared/responsive.dart';
import 'package:auto_tools/view_models/fuel_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuelComparerPage extends StatefulWidget {
  static String route = 'tools/fuel-comparer';

  const FuelComparerPage({Key? key}) : super(key: key);

  @override
  State<FuelComparerPage> createState() => _FuelComparerPageState();
}

class _FuelComparerPageState extends State<FuelComparerPage> {
  @override
  void initState() {
    super.initState();
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
          child: FutureBuilder(
              future: FuelType.find(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<FuelType>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Falha ao obter combustíveis'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Provider.of<FuelTypeViewModel>(context)
                      .setFuelTypes(snapshot.data!);

                  return Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Wrap(
                            spacing: 8,
                            children: snapshot.data!
                                .map(
                                  (ft) => FuelChip(
                                    ft,
                                    onSelected: (selected) {
                                      Provider.of<FuelTypeViewModel>(context,
                                              listen: false)
                                          .setSelected(ft);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size.fromHeight(8),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: Responsive(context).gridTiles,
                          // children: snapshot.data!
                          children: Provider.of<FuelTypeViewModel>(context)
                              .fuelTypes
                              .where((ft) => ft.selected)
                              .map((sft) => FuelCard(
                                    sft,
                                    key: Key(sft.id),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
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
        Provider.of<FuelTypeViewModel>(context, listen: false)
            .fuelTypes
            .where((ft) => ft.selected)
            .toList();

    cheaperFuelType = selectedTypes.reduce((value, element) =>
        value.pricePerLiter < element.pricePerLiter ? value : element);

    _showModal(cheaperFuelType);
  }

  _showModal(FuelType result) {
    showDialog(
      context: context,
      builder: (context) => Results(result),
    );
  }
}
