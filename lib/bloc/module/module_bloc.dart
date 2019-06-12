import 'package:flutter/gestures.dart';
import './module_events.dart';
import 'package:bloc/bloc.dart';
import 'package:sequencer/models/module.dart';

class ModuleBloc extends Bloc<ModuleEvent, List<Module>> {

  @override 
  List<Module> get initialState => [
    new Module(new Offset(190, 300), 'sequencer8')
  ];

  @override
  Stream<List<Module>> mapEventToState(
    ModuleEvent event
  ) async* {
    if (event is UpdateModule) {
      final List<Module> modules = currentState.map((module) {
        if (module.id == event.id) {
          return new Module(
            module.position + event.updatedPosition, 
            module.type,
            module.id
          );
        } else {
          return module;
        }
      }).toList();

      // print(modules);
      yield modules;
    }
  }
}