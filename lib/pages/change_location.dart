import 'package:flutter/material.dart';
import 'package:todo/services/world_time.dart';
import 'package:todo/data/locations.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  void updateTime(int index) async {
    WorldTime newTime = locations[index];
    await newTime.getData();

    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': newTime.location,
      'flag': newTime.flag,
      'time': newTime.time,
      'isDaytime': newTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (() {
                updateTime(index);
              }),
              title: Text(locations[index].location),
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}')),
            ),
          );
        },
      ),
    ));
  }
}
