import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/base.dart';
import 'package:flutter/material.dart';
import 'clock_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/bloc/module/index.dart';

class ClockWidget extends StatelessWidget {

  final Offset position;
  final String id;

  ClockWidget({
    @required this.position,
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    final ModuleBloc _moduleBloc = BlocProvider.of<ModuleBloc>(context);

    return Base(
      id: id,
      position: position,
      width: Clock.width,
      height: Clock.height,
      name: 'Clock',
      inputs: [],
      outputs: ['Clock'],
      child: GestureDetector(
        onTap: () {
          _moduleBloc.dispatch(StartModule(id));
        },
        child: Container(
          width: 50,
          height: 50,
          color: Color(0xffff7fff)
        )
      )
    );
  }

}

