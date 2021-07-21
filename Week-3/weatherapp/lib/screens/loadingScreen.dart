import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/weather.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State <Loading> {
  String city = 'Santacruz';
  void setUp () async {
    Weather I = Weather(location: city);
    await I.getWeather();
    Navigator.pushReplacementNamed(context, '/city', arguments: {
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