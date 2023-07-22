import 'package:flutter/material.dart';
import 'package:weather_task_t2/widgets/Bar.dart';
import '../globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.changeWeather});
  final Function changeWeather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bar(
              icons: [Icons.send_and_archive, Icons.location_city],
              changeWeather: widget.changeWeather),
             
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              
              children: [
                Text(firstCall ?"":
                  "${weather.city}",
                  style: TextStyle(color: Colors.blue, fontSize: 25)),
                  Text(firstCall ?"":
                  "${weather.temp} ${weather.getWeatherIcon()}",
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(firstCall ?"":
              "${weather.getMessageBasedOnTemperature()}",
              style: TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
