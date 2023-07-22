import 'package:flutter/material.dart';
import 'package:weather_task_t2/globals.dart';
import 'package:weather_task_t2/screens/BasePage.dart';

class Bar extends StatefulWidget {
  Bar({super.key, required this.icons, required this.changeWeather});
  List<IconData> icons;
  final Function changeWeather;

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    Map iconsWithFunctions = {
      Icons.location_city: () => 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BasePage(
                  pageName: searchPage,
                  changeWeather: widget.changeWeather,
                ),
              ),
            ),
      Icons.send_and_archive: () => widget.changeWeather(WeatherType.byUserLocation,context),
      Icons.arrow_back_ios_rounded: () => Navigator.pop(context)
    };


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.icons
          .map(
            (element) => IconButton(
              icon: Icon(element),
              onPressed: iconsWithFunctions[element],
            ),
          )
          .toList(),
    );
  }
}
