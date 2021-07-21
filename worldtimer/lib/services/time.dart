import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String L;
  String? T;
  String F;
  String U;
  bool? isDay;
  WorldTime ({required this.L, required this.F, required this.U});
  Future <void> getTime() async {
    try {
      Map timeMap = jsonDecode((await get(Uri.parse('http://worldtimeapi.org/api/timezone/$U'))).body);
      DateTime now = DateTime.parse(timeMap["datetime"]).add(Duration(hours: int.parse(timeMap["utc_offset"].substring(1,3)), minutes: int.parse(timeMap["utc_offset"].substring(4,6))));
      isDay = now.hour > 6 && now.hour < 20;
      T = DateFormat.jm().format(now);
    }
    catch (error) {
      print('Caught error: $error');
      T = 'Could not get time data.';
    }
  }
}