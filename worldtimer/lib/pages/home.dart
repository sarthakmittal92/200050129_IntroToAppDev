import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State <Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : jsonDecode(jsonEncode(ModalRoute.of(context)?.settings.arguments));
    String bgImg = data['isDay'] ? 'day.png' : 'night.png';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDay': result['isDay'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.red,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}