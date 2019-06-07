import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/bloc/counter_bloc.dart';
import 'package:sequencer/bloc/counter_events.dart';
import 'package:sequencer/models/module.dart';

class Sequencer8 extends StatelessWidget {

  final Offset position;
  final String id;

  Sequencer8({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    final ModuleBloc _moduleBloc = BlocProvider.of<ModuleBloc>(context);

    return BlocBuilder<ModuleEvent, List<Module>>(
      bloc: _moduleBloc,
      builder: (BuildContext context, List<Module> modules) {
        return Base(
          id: id,
          position: position,
          width: 500,
          height: 250,
          name: 'Sequencer 8',
          inputs: ['clock in'],
          outputs: ['cv out', 'gate out'],
          child: Text('hello there')
        );
      }
    );
  }

}

