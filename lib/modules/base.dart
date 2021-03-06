import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:sequencer/modules/socket.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/bloc/module/index.dart';

class Base extends StatelessWidget {

  final String id;
  final Offset position;
  final double width;
  final double height;
  final String name;
  final List<String> inputs;
  final List<String> outputs;
  final Widget child;

  Base({
    @required this.id, 
    @required this.width, 
    @required this.height, 
    @required this.position,
    @required this.name, 
    @required this.inputs, 
    @required this.outputs,
    @required this.child
  });
 
  @override
  Widget build(BuildContext context) {
    final ModuleBloc _moduleBloc = BlocProvider.of<ModuleBloc>(context);

    return Transform(
        transform: Matrix4.translationValues(position.dx, position.dy, 0.0),
        child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          _moduleBloc.dispatch(UpdateModule(id, details.delta));
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Color(0xff2c2c2c),
            borderRadius: BorderRadius.circular(10.0),
            border: new Border.all(color: Color(0xff0d0d0d))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                // color: Color(0xff0d0dff),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: inputs.map((input) => Socket(name: input, input: true)).toList()
                )
              ),
              Expanded(
                child: Container(
                  color: Color(0xff00002c).withOpacity(0.3),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(name)
                      ),
                      child ?? Container()
                    ],
                  )
                )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: outputs.map((output) => Socket(name: output, input: false)).toList()
                )
              )
            ]
          ),
        )
      )
    );
  }

}