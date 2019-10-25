import 'package:sequencer/models/module.dart';
import 'package:meta/meta.dart';
import 'package:flutter/gestures.dart';

const double _width = 350;
const double _height = 150;

const _inputs = {
  'clock_in': {
    'position': Offset(13, 18),
    'name': 'Clock'
  },
  'start_in': {
    'position': Offset(13, 42),
    'name': 'Start'
  },
  'length_in': {
    'position': Offset(13, 98),
    'name': 'Length'
  }
};
const _outputs = {
  'note_out': {
    'position': Offset(_width - 23, 18),
    'name': 'Note Out'
  }
};

@immutable
class StepSequencer extends Module {

  // static final double width = 350;
  // static final double height = 150;

  StepSequencer(position, id) : super(position, id);

  final Map<String, Offset> inputs = {
    'clock_in': Offset(13, 18),
    'start_in': Offset(13, 42),
    'length_in': Offset(13, 98),
  };

  final Map<String, Offset> outputs = {
    'note_out': Offset(width - 23, 18)
  };

  static get width {
    return _width;
  }

  static get height {
    return _height;
  }

  static List<String> get inputNames {
    return _inputs.values.map((input) => input['name']).toList();
  }

  static get outputNames {
    return _outputs.keys;
  }

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
