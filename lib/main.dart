import 'package:country_time/pages/home.dart';
import 'package:country_time/pages/loading.dart';
import 'package:country_time/pages/location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    )
  );
}

