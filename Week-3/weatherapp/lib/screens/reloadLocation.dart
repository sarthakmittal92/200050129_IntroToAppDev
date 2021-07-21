import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/weather.dart';

class Reload extends StatefulWidget {
  const Reload({Key? key}) : super(key: key);

  @override
  _ReloadState createState() => _ReloadState();
}

class _ReloadState extends State <Reload> {
  void setUp () async {
    Weather I = Weather(location: 'Mumbai');
    await I.getWeather();
    Navigator.pop(context, {
      'location': I.location,
      'weather': I.weather,
      'temp': I.temp,
    });
  }

  @override
  void initState () {
    super.initState();
    setUp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}