import 'package:sequencer/models/module.dart';
import 'package:meta/meta.dart';
import 'package:flutter/gestures.dart';

const double _width = 190;
const double _height = 100;

@immutable
class Clock extends Module {

  // static double width = 190;
  // static double height = 100;

  Clock(position, id) : super(position, id);

  final Map<String, Offset> inputs = {};
  final Map<String, Offset> outputs = {
    'clock_out': Offset(width - 23, 18),
  };

  static get width {
    return _width;
  }

  static get height {
    return _height;
  }

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
