import 'package:flutter/material.dart';
import 'globals.dart';
import 'screens/BasePage.dart';
import 'services/UserLocationService.dart';
import 'services/WeatherService.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  void getWeatherByUserLocation() {
    gotCurrentLocation().then(
      (value) {
        weather.lat = value.latitude;
        weather.lon = value.longitude;
        //print(value);
      },
    ).then(
      (value) => fetchWeatherByCity(weather.lat, weather.lon).then(
        (value) {
          //print(value["name"]);
          weather.city = value["name"];
          weather.idWeather = value["weather"][0]["id"];
          weather.temp = value["main"]["temp"];
          firstCall = false;
          setState(() {});
        },
      ),
    );
  }

  void getWeatherBySearchedLocation(BuildContext context) {
    fetchCityCoordinates(city).then((value) {
      weather.city = value["name"];
      weather.lat = value["lat"];
      weather.lon = value["lon"];

      fetchWeatherByCity(weather.lat, weather.lon).then(
        (value) {
          weather.idWeather = value["weather"][0]["id"];
          weather.temp = value["main"]["temp"];
          firstCall = false;
          //print(value);

          setState(() {});
          Navigator.pop(context);
        },
      );
    }).catchError(
      (err) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Not found the city. Please try again..."),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'ok'),
                child: const Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }
  

  Future<void> fetchWeather(WeatherType type, BuildContext context) async {
    //firstCall = false;
    if (type == WeatherType.byUserLocation) {
      getWeatherByUserLocation();
    } else {
      getWeatherBySearchedLocation(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (firstCall) fetchWeather(WeatherType.byUserLocation, context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        fontFamily: 'Schyler',
      ),
      home: BasePage(
        pageName: homePage,
        changeWeather: fetchWeather,
      ),
    );
  }
}
