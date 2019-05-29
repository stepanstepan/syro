import 'package:flutter/material.dart';
import 'screen.dart';

void main() => runApp(MyApp());

final List<Map<String, double>> modules = [
  {"x": 100, "y": 200},
  {"x": 300, "y": 400},
];

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Screen()
    );
  }

}

