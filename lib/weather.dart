import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather_provider.dart';
import 'package:weather_app/widget/weather_forcast_widget.dart';
import 'package:weather_app/widget/weather_widget.dart';
import 'package:weather_app/widget/addition_info_widget.dart';

class Weather extends ConsumerStatefulWidget {
  const Weather({super.key});

  @override
  ConsumerState<Weather> createState() => _WeatherState();
}

class _WeatherState extends ConsumerState<Weather> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
          future: fetchWeather(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final data = snapshot.data;
            final todaytempData = data['list'][0];

            final humidity = todaytempData['main']['humidity'];
            final windSpeed = todaytempData['wind']['speed'];
            final pressure = todaytempData['main']['pressure'];
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Weather_widget(todaytempData: todaytempData),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Weather Forcast",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final hourlyForecast = data['list'][index + 1];
                          final time = DateTime.parse(hourlyForecast['dt_txt']);
                          return ForcastWeatherWidget(
                            icon:
                                hourlyForecast['weather'][0]['main'] == 'Clear'
                                    ? Icons.sunny
                                    : Icons.cloud,
                            value: DateFormat.Hm().format(time),
                            label: hourlyForecast['weather'][0]['main'],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Additional_info_widget(
                        icon: Icons.water_drop,
                        value: humidity.toString(),
                        label: "Humidity",
                      ),
                      Additional_info_widget(
                        icon: Icons.air,
                        value: windSpeed.toString(),
                        label: "Wind Speed",
                      ),
                      Additional_info_widget(
                        icon: Icons.beach_access,
                        value: pressure.toString(),
                        label: "Pressure",
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
