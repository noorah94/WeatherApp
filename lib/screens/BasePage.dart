import 'package:flutter/material.dart';
import 'package:weather_task_t2/screens/HomePage.dart';
import 'package:weather_task_t2/screens/SearchPage.dart';

import '../globals.dart';

class BasePage extends StatefulWidget {
  BasePage({super.key, required this.pageName, required this.changeWeather});
  int pageName;
  final Function changeWeather;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  // static int home = 1;
  // static int search = 2;

  Map<int, String> page = {
    homePage: "location_background.jpeg",
    searchPage: "city_background.jpeg"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/${page[widget.pageName]}"),
              fit: BoxFit.cover),
        ),
        child: widget.pageName == homePage
            ? HomePage(changeWeather: widget.changeWeather)
            : SearchPage(changeWeather: widget.changeWeather),
      ),
    );
  }
}
