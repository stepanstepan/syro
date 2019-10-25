import 'dart:async';
import 'package:quiver/async.dart' as quiver;
import 'package:sequencer/dsp/nodes/node.dart';
import 'package:sequencer/dsp/tick.dart';

class ClockDSP extends Node {

  StreamSubscription _metronome;
  Duration ms = Duration(milliseconds: 1);
  double bpm = 120.0;
  int iteration = 0;

  List<String> inputs = [];
  Map<String, Map<String, List<dynamic>>> outputs = {
    'clock_out': {}
  };

  start() {
    stop();
    double quarterNote = 60000 / bpm;
    _metronome = quiver.Metronome.periodic(ms * quarterNote).listen(onTick);
  }

  stop() {
    _metronome?.cancel();
  }

  pause() {
    _metronome?.pause();
  }

  onTick(DateTime date) {
    var now = DateTime.now();
    print('START DATE $now');
    output(Tick(true, 0.0, bpm, iteration));
    iteration++;
  }

}