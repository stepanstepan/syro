import 'package:flutter/gestures.dart';
import './module_events.dart';
import 'package:bloc/bloc.dart';
import 'package:sequencer/models/module.dart';
import 'package:sequencer/models/cable.dart';

class ModuleBloc extends Bloc<ModuleEvent, List<dynamic>> {

  @override 
  List<dynamic> get initialState => [
    Module(Offset(80, 100), 'sequencer8', 'module_id_1'),
    Module(Offset(500, 300), 'sequencer8', 'module_id_2'),
    Cable(Offset(412, 151.5), Offset(518, 339), 'module_id_1', 'module_id_2')
  ];

  @override
  Stream<List<dynamic>> mapEventToState(
    ModuleEvent event
  ) async* {
    if (event is UpdateModule) {
      final List<dynamic> elements = currentState.map((node) {
        if (node is Module) {
          if (node.id == event.id) {
            return Module(
              node.position + event.updatedPosition, 
              node.type,
              node.id
            );
          } else {
            return node;
          }
        } else {
          if (node.startModuleId == event.id) {
            return Cable(
              node.startPosition + event.updatedPosition,
              node.endPosition,
              node.startModuleId,
              node.endModuleId,
              node.id
            );
          } else if (node.endModuleId == event.id) {
            return Cable(
              node.startPosition,
              node.endPosition + event.updatedPosition,
              node.startModuleId,
              node.endModuleId,
              node.id
            );
          } else {
            return node;
          }
        }
      }).toList();

      // print(elements);

      yield elements;
    }
  }
}