// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Map data = {};
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      data = data.isEmpty
          ? ModalRoute.of(context)?.settings.arguments as Map
          : data;
    } else {
      data = {};
    }
    String bgImage = data['isDaytime'] ? "day.jpg" : "night.jpg";

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                Text(
                  data.isEmpty ? "5:19" : data['time'],
                  style: TextStyle(
                      fontSize: 29.0,
                      letterSpacing: 2.0,
                      color: data['isDaytime']
                          ? Colors.grey[900]
                          : Colors.white70),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data.isEmpty ? "Jerusalem" : data['location'],
                  style: TextStyle(
                      fontSize: 29.0,
                      letterSpacing: 2.0,
                      color: data['isDaytime']
                          ? Colors.grey[900]
                          : Colors.white70),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'location': result["location"],
                        'flag': result["flag"],
                        'time': result["time"],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(Icons.location_city),
                  label: Text('Edit location'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
