import 'package:flutter/material.dart';

import 'package:weather_app/weather.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ColorScheme kColorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 146, 4, 4));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData().copyWith(
      //   colorScheme: kColorScheme,
      //   useMaterial3: true,
      //   appBarTheme: AppBarTheme()
      //       .copyWith(backgroundColor: kColorScheme.inversePrimary),
      // ),
      theme: ThemeData.dark(
        useMaterial3: true,
      ),

      home: const Weather(),
    );
  }
}
