import 'package:flutter/material.dart';
import 'package:worldtimer/services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State <Loading> {
  void setUp () async {
    WorldTime I = WorldTime(L: 'Kolkata', F: 'India.png', U: 'Asia/Kolkata');
    await I.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': I.L,
      'flag': I.F,
      'time': I.T.toString(),
      'isDay': I.isDay,
    });
  }
  @override
  void initState() {
    super.initState();
    setUp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}