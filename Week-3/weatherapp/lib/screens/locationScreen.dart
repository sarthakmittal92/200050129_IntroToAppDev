import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State <Location> {
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0,60.0,10.0,0),
          child: Column(
            children: <Widget> [
              SizedBox(height: 60.0),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.location_city_rounded),
                  labelText: 'Enter a city',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onSubmitted: (string) {
                  setState(() {
                    city = string;
                  });
                }
              ),
              SizedBox(height: 30.0),
              TextButton(
                onPressed: () async {
                  Weather I = Weather(location: city.toString());
                  await I.getWeather();
                  Navigator.pop(context, {
                    'location': I.location,
                    'weather': I.weather,
                    'temp': I.temp,
                  });
                },
                child: Text(
                  'GET WEATHER',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
