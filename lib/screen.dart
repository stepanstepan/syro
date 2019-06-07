import 'package:flutter/cupertino.dart';
import 'modules/markov.dart';
import 'modules/sequencer8.dart';
import 'modules/wire.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/bloc/counter_bloc.dart';
import 'package:sequencer/bloc/counter_events.dart';
import 'package:sequencer/models/module.dart';

const double DEFAULT_SCALE = 1.0;

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double _scale = DEFAULT_SCALE;
  double _scaleBefore;
  Offset _startingFocalPoint;
  Offset _previousOffset;
  Offset _offset = new Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    final ModuleBloc _moduleBloc = BlocProvider.of<ModuleBloc>(context);


    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onScaleStart: (ScaleStartDetails details) {
        _scaleBefore = _scale;
        _previousOffset = _offset;
        _startingFocalPoint = details.focalPoint;
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        final double newScale = _scaleBefore * details.scale;
        final Offset normalizedOffset = (_startingFocalPoint - _previousOffset) / _scaleBefore;
        final Offset newOffset = details.focalPoint - normalizedOffset * newScale;

        setState(() {
          _scale = newScale;
          _offset = newOffset;
        });
      },
      child: BlocBuilder<ModuleEvent, List<Module>>(
        bloc: _moduleBloc,
        builder: (BuildContext context, List<Module> modules) {
          return Container(
            color: Color(0xff0d0d0d),
            child: Transform(
              transform: new Matrix4.identity()
                ..translate(_offset.dx, _offset.dy)
                ..scale(_scale),
              child: Stack(
                children: modules.map((module) => 
                  Sequencer8(
                    id: module.id,
                    position: module.position
                  )
                ).toList()
              )
            )
          );
        }
      )



    );
  }

}