import 'dart:async';
import 'package:quiver/async.dart' as quiver;
import 'package:sequencer/dsp/nodes/node.dart';
import 'package:sequencer/dsp/tick.dart';

class StepSequencerDSP extends Node {

  List<String> inputs = [
    'clock_in',
    'start_in',
    'length_in'
  ];
  Map<String, Map<String, List<dynamic>>> outputs = {
    'note_out': {}
  };

}