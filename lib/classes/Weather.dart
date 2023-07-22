class Weather {
  String city = "";
  double lat = 0;
  double lon = 0;
  int idWeather = 0;
  double temp = 0;

  String getWeatherIcon() {
    if (idWeather < 300) return "🌩";
    if (idWeather < 400) return "🌧";
    if (idWeather < 600) return '☔️';
    if (idWeather < 700) return "☃";
    if (idWeather < 800) return "🌫";
    if (idWeather == 800) return "☀";
    if (idWeather < 805) return "☁";

    return "🤷‍";
  }

  String getMessageBasedOnTemperature() {
    //isFirst = false;
    if (temp > 25) return "It's 🍦 time";
    if (temp > 20) return "Time for shorts and 👕";
    if (temp > 9) return "Bring a 🧥 just in case'";
    return "You'll need 🧣 and 🧤";
  }

  //   Future<void> fetchWeather(String targetCity) async {
  //   Future<Map<String, dynamic>> cityCoordinates =
  //       fetchCityCoordinates(targetCity);
  //   cityCoordinates.then((value) {
  //     city = value["name"];
  //     lat = value["lat"];
  //     lon = value["lon"];

  //     Future<Map<String, dynamic>> weatherInfo = fetchWeatherByCity(lat, lon);
  //     weatherInfo.then((value) {
  //       idWeather = value["weather"][0]["id"];
  //       temp = value["main"]["temp"];
  //       print("  object $temp");
  //     });
  //   });
  // }
}
