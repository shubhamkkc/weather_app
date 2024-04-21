import 'package:flutter/material.dart';

class Additional_info_widget extends StatelessWidget {
  const Additional_info_widget({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });
  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 44,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
          Text(
            "$value",
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
