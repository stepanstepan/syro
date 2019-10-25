import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';
import 'package:flutter/material.dart';
import 'step_sequencer_model.dart';

class StepSequencerWidget extends StatelessWidget {

  final Offset position;
  final String id;

  StepSequencerWidget({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    print('build step sequencer $id');
    print(StepSequencer.inputNames);
    
    return Base(
      id: id,
      position: position,
      width: StepSequencer.width,
      height: StepSequencer.height,
      name: 'Sequencer 8',
      // inputs: ['Clock', 'Start', 'Length'],
      inputs: ['Clock', 'Start', 'Length'],
      outputs: ['Note'],
      child: Text('hello there')
    );
  }

}
