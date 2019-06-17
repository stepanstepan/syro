import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/markov.dart';
import 'modules/sequencer8.dart';
import 'modules/wire.dart';

import 'package:sequencer/bloc/module/index.dart';
import 'package:sequencer/models/module.dart';
import 'package:sequencer/models/cable.dart';

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
      child: BlocBuilder<ModuleEvent, Map<String, dynamic>>(
        bloc: _moduleBloc,
        builder: (BuildContext context, Map<String, dynamic> nodes) {
          return Container(
            color: Color(0xff0d0d0d),
            child: Transform(
              transform: new Matrix4.identity()
                ..translate(_offset.dx, _offset.dy)
                ..scale(_scale),
              child: Stack(
                children: 
                  nodes.entries.map((node) {
                    if (node.value is Module) {
                      return Sequencer8Node(
                        id: node.key, 
                        position: node.value.position
                      );
                    } else {
                      return Wire(
                        source: nodes[node.value.source[0]].position + nodes[node.value.source[0]].outputs[node.value.source[1]], 
                        target: nodes[node.value.target[0]].position + nodes[node.value.target[0]].inputs[node.value.target[1]],
                      );
                    }
                  }).toList()
              )
            )
          );
        }
      )
    );
  }

}