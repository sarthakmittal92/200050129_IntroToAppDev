import 'package:flutter/material.dart';
import 'package:worldtimer/services/time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State <Location> {
  List <WorldTime> locations = [
    WorldTime(U: 'Asia/Kolkata', L: 'Kolkata', F: 'india.png'),
    WorldTime(U: 'Europe/London', L: 'London', F: 'uk.png'),
  ];
  void updateTime (index) async {
    WorldTime newTime = locations[index];
    await newTime.getTime();
    Navigator.pop(context, {
      'location': newTime.L,
      'flag': newTime.F,
      'time': newTime.T.toString(),
      'isDay': newTime.isDay,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].L),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].F}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}