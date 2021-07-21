import 'package:flutter/material.dart';
import 'package:worldtimer/pages/home.dart';
import 'package:worldtimer/pages/location.dart';
import 'package:worldtimer/pages/loading.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
  },
));