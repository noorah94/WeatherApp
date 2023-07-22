library globals;

import 'package:weather_task_t2/classes/Weather.dart';

Weather weather = Weather();

enum WeatherType { byUserLocation, bySearchedLocation }

String city = "";
bool firstCall = true;
int homePage = 1;
int searchPage = 2;

//enum  pageName {home , search}
