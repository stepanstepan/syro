import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';

class Sequencer8 extends StatelessWidget {

  Offset position;
  Sequencer8({@required this.position});

  @override
  Widget build(BuildContext context) {
    return Base(
      width: 400,
      height: 200,
      position: position,
      name: 'Sequencer 8',
      inputs: ['clock in'],
      outputs: ['cv out', 'gate out'],
      child: Container(
        child: Text('Sequencer will placed here'),
      )
    );
  }

}

