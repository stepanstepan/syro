import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';
import 'package:flutter/material.dart';
import 'package:sequencer/models/sequencer8.dart';

class Sequencer8Node extends StatelessWidget {

  final Offset position;
  final String id;

  Sequencer8Node({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Base(
      id: id,
      position: position,
      width: Sequencer8.width,
      height: Sequencer8.height,
      name: 'Sequencer 8',
      inputs: Sequencer8.inputsList,
      outputs: Sequencer8.outputsList,
      child: Text('hello there')
    );
  }

}

