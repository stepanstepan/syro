import 'package:flutter/cupertino.dart';
import 'modules/markov.dart';
import 'modules/sequencer8.dart';
import 'modules/wire.dart';

import 'blocs/modules/modules_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/models/module.dart';

const double DEFAULT_SCALE = 1.0;

class Screen extends StatelessWidget {
  double _scale = DEFAULT_SCALE;
  double _scaleBefore;
  Offset _startingFocalPoint;
  Offset _previousOffset;
  Offset _offset = new Offset(0.0, 0.0);

  // final ModulesBloc _modulesBloc = ModulesBloc();

  @override
  Widget build(BuildContext context) {
    // final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final ModulesBloc _modulesBloc = BlocProvider.of<ModulesBloc>(context);

    return GestureDetector(
      // onScaleStart: (ScaleStartDetails details) {
      //   _scaleBefore = _scale;
      //   _previousOffset = _offset;
      //   _startingFocalPoint = details.focalPoint;
      // },
      // onScaleUpdate: (ScaleUpdateDetails details) {
      //   final double newScale = _scaleBefore * details.scale;
      //   final Offset normalizedOffset = (_startingFocalPoint - _previousOffset) / _scaleBefore;
      //   final Offset newOffset = details.focalPoint - normalizedOffset * newScale;

      //   // setState(() {
      //   //   _scale = newScale;
      //   //   _offset = newOffset;
      //   // });
      // },
      child: Container(
        color: Color(0xff0d0d0d),
        child: Transform(
          transform: new Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          child: BlocBuilder(
            bloc: _modulesBloc,
            builder: (BuildContext context, List<Module> modules) {
              return Stack(
                children: [
                  ...modules.map((module) => Sequencer8(position: module.position, id: module.id)).toList(),
                  Text('$modules'),
                  // Text(modules[0].position.dx.toString())
                ]
              );
            },
          )
        )  
          
        )
      
    );
  }

  // @override
  // void dispose() {
  //   _modulesBloc.dispose();
  //   // super.dispose();
  // }

}