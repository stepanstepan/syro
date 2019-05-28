import 'package:flutter/material.dart';
import 'modules/markov.dart';
import 'modules/sequencer8.dart';
import 'modules/wire.dart';

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
      child: Container(
        // padding: EdgeInsets.all(20),
        color: Color(0xff0d0d0d),
        child: SingleChildScrollView(
          child: Stack(
          // children: modules.map((module) => Markov(x: module["x"], y: module["y"])).toList()
          children: <Widget>[
            Sequencer8(x: 100, y: 200),
            Markov(x: 400, y: 500),
            Wire(startX: 117, startY: 383, endX: 417, endY: 515)
          ],
        )
        )
        
      )
    );
  }

}

