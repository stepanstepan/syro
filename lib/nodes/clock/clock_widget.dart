import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';
import 'package:flutter/material.dart';
import 'clock_model.dart';

class ClockWidget extends StatelessWidget {

  final Offset position;
  final String id;

  ClockWidget({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Base(
      id: id,
      position: position,
      width: Clock.width,
      height: Clock.height,
      name: 'Clock',
      inputs: [],
      outputs: ['dwwd','wdwd','wdd'],
      child: null
    );
  }

}

