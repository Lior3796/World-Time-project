import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:todo/services/format_time.dart';

class WorldTime {
  String time = "";
  String url;
  String location;
  String flag;
  bool isDaytime = true;

  WorldTime({
    required this.flag,
    required this.location,
    required this.url,
  });

  Future<void> getData() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    DateTime now = formatTime(data);
    isDaytime = now.hour > 5 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
