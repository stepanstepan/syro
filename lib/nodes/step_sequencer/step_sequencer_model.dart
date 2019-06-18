import 'package:sequencer/models/module.dart';
import 'package:meta/meta.dart';
import 'package:flutter/gestures.dart';

@immutable
class StepSequencer extends Module {

  static final double width = 350;
  static final double height = 150;

  final Map<String, Offset> inputs = {
    'note_in': Offset(17.5, 52),
    'reset_in': Offset(17.5, 98),
  };

  final Map<String, Offset> outputs = {
    'note_out': Offset(width - 17.5, 75)
  };

  StepSequencer(position, id) : super(position, id);

  String toString() {
    return 'StepSequencer { id: $id, position: $position }';
  }

  StepSequencer copyWith({Offset position}) {
    return StepSequencer(
      position ?? this.position,
      id ?? this.id
    );
  }

}
