import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchCityCoordinates(String city) async {
  final response = await http.get(Uri.parse(
      'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=6d648a9734984b2f8f607f164e1d0f7f'));
  if (response.statusCode == 200) {
    return json.decode(response.body).cast<Map<String, dynamic>>()[0];
  } else {
    throw Exception('Unable to fetch weather from the REST API');
  }
}

Future<Map<String, dynamic>> fetchWeatherByCity(double lat, double lon) async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=6d648a9734984b2f8f607f164e1d0f7f'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Unable to fetch weather from the REST API');
  }
}


