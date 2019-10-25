import 'dart:async';
import 'dart:typed_data';
import 'package:quiver/async.dart' as quiver;
import 'package:flutter_midi_command/flutter_midi_command.dart';
import 'package:sequencer/dsp/curcuit.dart';

import 'package:sequencer/dsp/nodes/clock.dart';
import 'package:sequencer/dsp/nodes/step_sequencer.dart';
import 'package:sequencer/dsp/nodes/midi_out.dart';
import 'package:sequencer/dsp/nodes/node.dart';

const ms = Duration(milliseconds: 1);

class DSP {
  static final DSP _dsp = new DSP._internal();

  factory DSP() {
    return _dsp;
  }

  DSP._internal();

  Circuit _curcuit = Circuit(); 
  // MidiCommand _midiCommand = MidiCommand();
  // StreamSubscription _metronome;

  // onTick(DateTime date) {
  //   print('tick $date');
  //   NoteOnMessage(channel: 1, note: 67, velocity: 100);
  //   Future.delayed(ms * 500, () {
  //     NoteOffMessage(channel: 1, note: 67, velocity: 100);
  //   });
  // }

  void start() async {
    print('void start');

    final _clock = ClockDSP();
    final _sequencer = StepSequencerDSP();
    final _midiOut = MidiOutDSP();

    print('_clock: $_clock');

    _curcuit.addNode(_clock);
    _curcuit.addNode(_sequencer);
    _curcuit.addNode(_midiOut);

    _curcuit.connectOutToIn(_clock.id, 'clock_out', _sequencer.id, 'clock_in');
    _curcuit.connectOutToIn(_sequencer.id, 'note_out', _midiOut.id, 'note_in');

    // print('ADDED!');

    _clock.start();

    // final devices = await _midiCommand.devices;
    // List<MidiDevice> devices = await _midiCommand.devices;
    // print(devices[1].name);
    // _midiCommand.connectToDevice(devices[1]);


    // _metronome = quiver.Metronome.periodic(ms * 1500).listen(onTick);
  }
}


