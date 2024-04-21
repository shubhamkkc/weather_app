import 'dart:convert' as convert;
import 'config.dart';
import 'package:http/http.dart' as http;

Future fetchWeather() async {
  const weatherUrl =
      'https://api.openweathermap.org/data/2.5/forecast?q=patna&APPID=${AppConfig.apiKey}'; //insert your openWeather api key

  var response = await http.get(Uri.parse(weatherUrl));
  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
  print(jsonResponse['list'][0]['main']['temp']);
  jsonResponse['list'][0]['main']['temp'];
  return jsonResponse;
}
