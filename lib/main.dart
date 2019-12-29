import 'package:flutter/material.dart';
import 'package:straight_machien/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ツッコミ",
      home: HomeScreen(),
      theme: ThemeData.dark(),
    );
  }
}
