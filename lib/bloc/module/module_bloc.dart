import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:sequencer/bloc/module/module_events.dart';
import 'package:sequencer/models/cable.dart';
import 'package:sequencer/nodes/index.dart';

import 'package:sequencer/dsp/dsp.dart';

// int loop(int val) {
//         int count = 0;
//         for (int i = 1; i <= val; i++) {
//           count += i;
//         }
//         return count;
//       }

class ModuleBloc extends Bloc<ModuleEvent, Map<String, dynamic>> {

  @override 
  Map<String, dynamic> get initialState => {
    'module_id_3': Clock(Offset(40, 100), 'module_id_3'),
    'module_id_1': StepSequencer(Offset(250, 50), 'module_id_1'),
    'module_id_2': StepSequencer(Offset(620, 50), 'module_id_2'),
    'cable_id_1': Cable(['module_id_1', 'note_out'], ['module_id_2', 'clock_in']),
    'cable_id_2': Cable(['module_id_1', 'note_out'], ['module_id_2', 'start_in']),
    'cable_id_3': Cable(['module_id_3', 'clock_out'], ['module_id_1', 'clock_in']),
  };

  final _dsp = DSP();


  @override
  Stream<Map<String, dynamic>> mapEventToState(
    ModuleEvent event
  ) async* {
    if (event is UpdateModule) {
      final node = currentState[event.id];
      currentState[event.id] = node.copyWith(position: node.position + event.updatedPosition);
      yield new Map<String, dynamic>.from(currentState);
    }

    if (event is StartModule) {
      _dsp.start();

      
       
       
      // inner(int test)  {
      //   print('hello tehre');
      //   return 'ready';
      // }

      

      // Timer.periodic(new Duration(milliseconds: 300), (Timer timer) async {
      //   final now = new DateTime.now();
      //   print('timer $now');
      //   int result = await compute(loop, 10);
      //   print('result $result');
      // });
      
    }
  }
}