import 'package:flutter/material.dart';
import 'home_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IBMPlexSans'),
      home: HomeScreen(),
    );
  }
}
