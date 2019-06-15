import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';
import 'package:flutter/material.dart';

class Sequencer8 extends StatelessWidget {

  final Offset position;
  final String id;

  Sequencer8({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Base(
      id: id,
      position: position,
      width: 350,
      height: 150,
      name: 'Sequencer 8',
      inputs: ['clock_in', 'gate_in', 'third_in'],
      outputs: ['cv_out', 'gate_out'],
      child: Text('hello there')
    );
  }

}

