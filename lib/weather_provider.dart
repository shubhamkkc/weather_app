import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Future fetchWeather() async {
  final weatherUrl =
      'https://api.openweathermap.org/data/2.5/forecast?q=patna&APPID=fc8a070fff381709c2907defd1d0db98';

  var response = await http.get(Uri.parse(weatherUrl));
  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  print(jsonResponse['list'][0]['main']['temp']);
  jsonResponse['list'][0]['main']['temp'];
  return jsonResponse;
}
