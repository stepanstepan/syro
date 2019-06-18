import 'module.dart';
import 'package:meta/meta.dart';
import 'package:flutter/gestures.dart';

const double WIDTH = 350;
const double HEIGHT = 150;

@immutable
class Sequencer8 extends Module {

  Sequencer8(position, id) : super(position, id);

  final Map<String, Offset> inputs = {
    'note_in': Offset(17.5, 52),
    'reset_in': Offset(17.5, 98),
  };

  final Map<String, Offset> outputs = {
    'note_out': Offset(WIDTH - 17.5, 75)
  };

  String toString() {
    return 'Sequencer8 { id: $id, position: $position }';
  }

  static double get width {
    return WIDTH;
  }

  static double get height {
    return HEIGHT;
  }

  static List<String> get inputsList {
    return ['note_in', 'reset_in'];
  }

  static List<String> get outputsList {
    return ['note_out'];
  }

}
