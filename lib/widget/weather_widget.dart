import 'dart:ui';

import 'package:flutter/material.dart';

class Weather_widget extends StatelessWidget {
  Weather_widget({required this.todaytempData, super.key});
  final todaytempData;

  @override
  Widget build(BuildContext context) {
    final currentTempinK = todaytempData['main']['temp'];
    final currentTempinC = (currentTempinK - 273.15).toStringAsFixed(2);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // color: Colors.amber,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${currentTempinC}°C',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    todaytempData['weather'][0]['main'] == 'clear'
                        ? Icons.sunny
                        : Icons.cloud,
                    size: 66,
                  ),
                  Text(
                    todaytempData['weather'][0]['main'],
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
