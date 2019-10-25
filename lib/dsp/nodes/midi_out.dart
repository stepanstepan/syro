import 'dart:async';
import 'package:quiver/async.dart' as quiver;
import 'package:sequencer/dsp/nodes/node.dart';
import 'package:sequencer/dsp/tick.dart';

class MidiOutDSP extends Node {

  List<String> inputs = [
    'note_in'
  ];
  Map<String, Map<String, List<dynamic>>> outputs = {};

  output(Tick tick) {
    var now = DateTime.now();
    print('END DATE $now');
    print('midi out catch tick: ${tick.iteration}');
  }

}