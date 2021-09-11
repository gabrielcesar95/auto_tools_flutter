import 'package:auto_tools/models/fuel_type.dart';
import 'package:flutter/material.dart';

class FuelChip extends StatefulWidget {
  const FuelChip(this.fuelType, {Key? key, this.onSelected}) : super(key: key);

  final FuelType fuelType;
  final Function(bool)? onSelected;

  @override
  _FuelChipState createState() => _FuelChipState();
}

class _FuelChipState extends State<FuelChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.fuelType.title),
      selected: widget.fuelType.selected,
      onSelected: widget.onSelected,
    );
  }
}
