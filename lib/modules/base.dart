import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sequencer/modules/socket.dart';
import 'package:sequencer/models/module.dart';
import 'package:sequencer/blocs/modules/modules_bloc.dart';
import 'package:sequencer/blocs/modules/modules_event.dart';

class Base extends StatelessWidget {

  String id;
  Offset position;
  double width;
  double height;
  String name;
  List<String> inputs;
  List<String> outputs;
  Widget child;
  final ModulesBloc _modulesBloc = ModulesBloc();

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
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<ModulesBloc>(bloc: _modulesBloc),
      ],
      child: Transform(
        transform: Matrix4.translationValues(position.dx, position.dy, 0.0),
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            // setState(() {
            //   position += details.delta;
            // });
            // print(position);
            _modulesBloc.dispatch(UpdateModule(id, details.delta));
          },
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Color(0xff2c2c2c),
              borderRadius: BorderRadius.circular(10.0),
              border: new Border.all(color: Color(0xff0d0d0d))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: inputs.map((input) => Socket(name: input)).toList()),
                      Text(name)
                    ]
                  )
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: child
                  )
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: outputs.map((input) => Socket(name: input)).toList()
                  )
                )
              ]
            ),
          )
        )
      )
    );
  }

}