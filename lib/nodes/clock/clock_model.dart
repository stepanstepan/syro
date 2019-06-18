import 'package:sequencer/models/module.dart';
import 'package:meta/meta.dart';
import 'package:flutter/gestures.dart';

@immutable
class Clock extends Module {

  static double width = 150;
  static double height = 100;

  final Map<String, Offset> inputs = {};
  final Map<String, Offset> outputs = {
    'clock_out': Offset(width - 17.5, 27),
    'gate_out': Offset(width - 17.5, 50),
    'play_out': Offset(width - 17.5, 73),
  };

  Clock(position, id) : super(position, id);

  String toString() {
    return 'Clock { id: $id, position: $position }';
  }

  Clock copyWith({Offset position}) {
    return Clock(
      position ?? this.position,
      id ?? this.id
    );
  }

}
