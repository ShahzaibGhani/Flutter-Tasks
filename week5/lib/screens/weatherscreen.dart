import 'package:flutter/material.dart';
import '../weather/weather.dart';
import '../weather/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String weatherInfo = "";
  Weather weather = Weather("", 0, 0, 0, 0, "");
  HttpHelper httpHelper = HttpHelper();
  @override
  void initState() {
    super.initState();

    httpHelper.GetWeather("31.573152", "74.3078585").then((weatherObj) {
      weather = weatherObj;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Weather Info")),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                "${weather.temperature.toStringAsFixed(0)}\u2103",
                style: const TextStyle(fontSize: 100),
              ),
            ),
            createAWeatherRow("Location", "GCU"),
            createAWeatherRow("City Name", weather.cityName),
            createAWeatherRow("Wind Speed", weather.windSpeed.toString()),
            createAWeatherRow("Cloud Cover", weather.cloudCover.toString()),
            createAWeatherRow("Humidity", weather.humidity.toString()),
            createAWeatherRow("Desciption", weather.description)
          ],
        ),
      ),
    );
  }

  Widget createAWeatherRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 20, bottom: 4, top: 4),
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: Center(
                child: Text(key,
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
              )),
          Expanded(
              flex: 7,
              child: Center(
                child: Text(value,
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
              )),
        ],
      ),
    );
  }
}
