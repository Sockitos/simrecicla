import 'package:flutter/material.dart';

class MaterialInfo extends StatelessWidget {
  const MaterialInfo({
    super.key,
    required this.label,
    this.labelStyle,
    this.weight = 0,
    this.composition = 0,
    this.recovered,
  });

  final String label;
  final TextStyle? labelStyle;
  final double weight;
  final double composition;
  final double? recovered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                label,
                style: labelStyle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              (weight.isNaN ? 0 : weight).toStringAsFixed(2),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${((composition.isNaN ? 0 : composition) * 100).toStringAsFixed(2)}%',
              textAlign: TextAlign.center,
            ),
          ),
          if (recovered != null)
            Expanded(
              child: Text(
                '${((recovered!.isNaN ? 0 : recovered!) * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
