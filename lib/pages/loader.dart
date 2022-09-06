// ignore_for_file: use_build_context_synchronously, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:todo/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  String time = "Loading...";

  void getTime() async {
    try {
      WorldTime datetime =
          WorldTime(flag: "flag", location: "Jerusalem", url: "Asia/Jerusalem");

      await datetime.getData();
      time = datetime.time;

      Navigator.pushNamed(context, '/home', arguments: {
        'location': datetime.location,
        'flag': datetime.flag,
        'time': time,
        'isDaytime': datetime.isDaytime
      });
    } catch (e) {
      setState(() {
        time = "Could not get time";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
