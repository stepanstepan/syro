import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sequencer/blocs/modules/modules_event.dart';
import 'package:sequencer/blocs/modules/modules_state.dart';
import 'package:sequencer/models/module.dart';

// enum ModulesEvent { add, delete, update, updatePosition }

class ModulesBloc extends Bloc<ModulesEvent, List<Module>> {
  
  @override 
  List<Module> get initialState => [
    new Module(new Offset(190, 300), 'sequencer')
  ];

  @override
  Stream<List<Module>> mapEventToState(
    List<Module> currentState, 
    ModulesEvent event
  ) async* {
    if (event is UpdateModule) {
      // currentState[0].position += event.updatedPosition;
      currentState[0] = new Module(currentState[0].position + event.updatedPosition, currentState[0].type);
      print(currentState[0].position);
      // print(event);
      // yield List<Module>.from(currentState);
      // return;

      // yield* _mapUpdateModuleToState(currentState, event);
    }
    // switch (event) {
    //   case ModulesEvent.add:

    //     break;
    //   case ModulesEvent.delete:

    //     break;
    //   case ModulesEvent.update:

    //     break;
    //   case ModulesEvent.updatePosition:
    //     print('updating');
    //     print(currentState);
    //     // yield* currentState.map
    //     break;
    // }
  }


  // Stream<List<Module>> _mapUpdateModuleToState(
  //   List<Module> currentState,
  //   UpdateModule event,
  // ) async* {
  //   print('run _mapUpdateModuleToState');
  //   print(event);
    
  //     // final List<Module> updatedModules = currentState.modules.map((module) {
  //     //   return module.id == event.updatedModule.id ? event.updatedModule : module;
  //     // }).toList();
  //     // yield ModulesLoaded(updatedModules);
  //     // // _saveModules(updatedModules);
  //   }
  // }

}


// class ModulesBloc extends Bloc<ModulesEvent, ModulesState> {
//   // final ModulesRepository modulesRepository;

//   // ModulesBloc({@required this.modulesRepository});

//   @override
//   ModulesState get initialState => ModulesLoading();

//   @override
//   Stream<ModulesState> mapEventToState(
//     ModulesState currentState,
//     ModulesEvent event,
//   ) async* {
//     if (event is LoadModules) {
//       yield* _mapLoadModulesToState();
//     } else if (event is AddModule) {
//       yield* _mapAddModuleToState(currentState, event);
//     } else if (event is UpdateModule) {
//       yield* _mapUpdateModuleToState(currentState, event);
//     } else if (event is DeleteModule) {
//       yield* _mapDeleteModuleToState(currentState, event);
//     }
//   }

//   Stream<ModulesState> _mapLoadModulesToState() async* {
//     try {
//       final position = new Offset(100, 100);
//       final modules = [new Module(position, ['cv in', 'gate in'], ['cv out'], 'sequencer')];
//       yield ModulesLoaded(
//         modules.map(Module.fromEntity).toList()
//       );
//     } catch (_) {
//       print('Modules not loaded');
//     }
//   }

//   Stream<ModulesState> _mapAddModuleToState(
//     ModulesState currentState,
//     AddModule event,
//   ) async* {
//     if (currentState is ModulesLoaded) {
//       final List<Module> updatedModules = List.from(currentState.modules)
//         ..add(event.module);
//       yield ModulesLoaded(updatedModules);
//       // _saveModules(updatedModules);
//     }
//   }

//   Stream<ModulesState> _mapUpdateModuleToState(
//     ModulesState currentState,
//     UpdateModule event,
//   ) async* {
//     if (currentState is ModulesLoaded) {
//       final List<Module> updatedModules = currentState.modules.map((module) {
//         return module.id == event.updatedModule.id ? event.updatedModule : module;
//       }).toList();
//       yield ModulesLoaded(updatedModules);
//       // _saveModules(updatedModules);
//     }
//   }

//   Stream<ModulesState> _mapDeleteModuleToState(
//     ModulesState currentState,
//     DeleteModule event,
//   ) async* {
//     if (currentState is ModulesLoaded) {
//       final updatedModules =
//           currentState.modules.where((module) => module.id != event.module.id).toList();
//       yield ModulesLoaded(updatedModules);
//       // _saveModules(updatedModules);
//     }
//   }
  
//   // Future _saveModules(List<Module> modules) {
//   //   return modulesRepository.saveModules(
//   //     modules.map((module) => module.toEntity()).toList()
//   //   );
//   // }

// }