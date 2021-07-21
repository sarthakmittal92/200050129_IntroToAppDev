import 'package:flutter/material.dart';
import 'package:weatherapp/screens/loadingScreen.dart';
import 'package:weatherapp/screens/locationScreen.dart';
import 'package:weatherapp/screens/cityScreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/city': (context) => City(),
  },
));