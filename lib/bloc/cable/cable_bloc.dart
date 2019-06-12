// import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:sequencer/bloc/cable/cable_events.dart';
import 'package:bloc/bloc.dart';
import 'package:sequencer/models/cable.dart';

class CableBloc extends Bloc<CableEvent, List<Cable>> {

  @override 
  List<Cable> get initialState => [
    new Cable('module_id_1-out', 'module_id_2-in', new Offset(20, 150), new Offset(20, 50))
  ];

  @override
  Stream<List<Cable>> mapEventToState(
    CableEvent event
  ) async* {
    // if (event is UpdateModule) {
    //   final List<Module> modules = currentState.map((module) {
    //     if (module.id == event.id) {
    //       return new Module(
    //         module.position + event.updatedPosition, 
    //         module.type,
    //         module.id
    //       );
    //     } else {
    //       return module;
    //     }
    //   }).toList();

    //   // print(modules);
    //   yield modules;
    // }
  }
}