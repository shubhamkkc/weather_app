import 'package:flutter/material.dart';

class ForcastWeatherWidget extends StatelessWidget {
  const ForcastWeatherWidget({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              size: 44,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
