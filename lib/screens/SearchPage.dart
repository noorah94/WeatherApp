import 'package:flutter/material.dart';
import '../globals.dart';
import '../widgets/Bar.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.changeWeather});
  final Function changeWeather;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Bar(
            icons: [Icons.arrow_back_ios_rounded],
            changeWeather: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.location_city),
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) => city = value,
                  style:TextStyle(fontFamily: 'Raleway'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter city name',
                    filled: true,
                    fillColor: Colors.white,
                  
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () => widget.changeWeather(
                WeatherType.bySearchedLocation,
                context) 
            ,
            child: const Text('Get Weather',style: TextStyle(fontSize: 25 , color: Colors.white),),
           // style: ButtonStyle(),
          ),
        ],
      ),
    );
  }
}
