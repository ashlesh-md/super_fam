import 'package:flutter/material.dart';

class KeyValuePairCard extends StatelessWidget {
  final String keyText;
  final String valueText;

  const KeyValuePairCard(
      {required this.keyText, required this.valueText, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.label, color: Colors.indigo),
        title: Text(
          keyText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(valueText),
      ),
    );
  }
}
