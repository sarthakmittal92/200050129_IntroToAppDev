import 'package:flutter/material.dart';
import 'dart:convert';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State <City> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : jsonDecode(jsonEncode(ModalRoute.of(context)?.settings.arguments));
    print(data);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.0,60.0,2.0,0.0),
          child: Column(
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.near_me_rounded,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'weather': result['weather'],
                          'temp': result['temp'],
                        };
                      });
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.location_city_rounded,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
