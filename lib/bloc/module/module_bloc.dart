import 'package:flutter/gestures.dart';
import './module_events.dart';
import 'package:bloc/bloc.dart';
import 'package:sequencer/models/module.dart';
import 'package:sequencer/models/cable.dart';
import 'package:sequencer/models/sequencer8.dart';
import 'package:sequencer/nodes/index.dart';

class ModuleBloc extends Bloc<ModuleEvent, Map<String, dynamic>> {

  @override 
  Map<String, dynamic> get initialState => {
    'module_id_3': Clock(Offset(80, 100), 'module_id_3'),
    'module_id_1': StepSequencer(Offset(250, 50), 'module_id_1'),
    'module_id_2': StepSequencer(Offset(620, 50), 'module_id_2'),
    'cable_id_1': Cable(['module_id_1', 'note_out'], ['module_id_2', 'note_in']),
    'cable_id_2': Cable(['module_id_1', 'note_out'], ['module_id_2', 'reset_in']),
    'cable_id_3': Cable(['module_id_3', 'clock_out'], ['module_id_1', 'reset_in']),
  };

  @override
  Stream<Map<String, dynamic>> mapEventToState(
    ModuleEvent event
  ) async* {
    if (event is UpdateModule) {
      final node = currentState[event.id];
      currentState[event.id] = node.copyWith(position: node.position + event.updatedPosition);
      yield new Map<String, dynamic>.from(currentState);

         

      // final List<dynamic> elements = currentState.map((node) {
      //   if (node.id == event.id) {
      //     return Module(
      //       node.position + event.updatedPosition, 
      //       node.type,
      //       node.id
      //     );
      //   } else {
      //     return node;
      //   }
      // }).toList();

      // // print(elements);

      // yield elements;
    }
  }
}