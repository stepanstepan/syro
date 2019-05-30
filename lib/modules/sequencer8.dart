import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';

class Sequencer8 extends StatelessWidget {

  Sequencer8({@required this.x, @required this.y});
  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return Base(
      width: 400,
      height: 200,
      x: x,
      y: y,
      name: 'Sequencer 8',
      inputs: ['clock in'],
      outputs: ['cv out', 'gate out'],
      child: Container(
        child: Text('Sequencer will placed here'),
      )
    );
  }

}

