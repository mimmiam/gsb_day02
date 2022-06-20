import 'package:flutter/material.dart';
import 'package:gsb_day2/pages/home.dart';
import 'package:gsb_day2/pages/editInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/editinfo': ((context) => EditInfoScreen()),
      },
      title: 'GSB Day 2',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        primarySwatch: Colors.lightGreen,
        secondaryHeaderColor: Colors.orange
      ),
      home: HomeScreen(),
    );
  }
}

