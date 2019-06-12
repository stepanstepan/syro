import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';
import 'package:flutter/material.dart';

class Drgbl extends StatelessWidget {

  final Offset position;
  final String id;

  Drgbl({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Base(
        id: id,
        position: position,
        width: 500,
        height: 250,
        name: 'Drgbl',
        inputs: ['clock in'],
        outputs: ['cv out', 'gate out'],
        child: Text('hello there')
      ),
      feedback: Base(
        id: id,
        position: position,
        width: 500,
        height: 250,
        name: 'Drgbl',
        inputs: ['clock in'],
        outputs: ['cv out', 'gate out'],
        child: Text('hello there')
      ),
    );
  }

}

