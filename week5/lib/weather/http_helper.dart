import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week5/weather/weather.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=31.573152&lon=74.3078585&appid=6dd840424f5d88e9cb70526bbfd1947f

  final String domainName = "api.openweathermap.org";
  final String path = "data/2.5/weather";
  final apiKey = "6dd840424f5d88e9cb70526bbfd1947f";
  Future<Weather> GetWeather(String lat, String lon) async {
    Map<String, dynamic> parameters = {"lat": lat, "lon": lon, "appid": apiKey};
    Uri url = Uri.https(domainName, path, parameters);
    http.Response response = await http.get(url);
    var data = json.decode(response.body);

    Weather obj = Weather.fromJson(data);

    return obj;
  }
}
