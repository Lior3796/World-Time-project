// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/change_location.dart';
import 'package:todo/pages/loader.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loader(),
      '/home': (context) => Home(),
      '/location': (context) => ChangeLocation(),
    },
  ));
}
