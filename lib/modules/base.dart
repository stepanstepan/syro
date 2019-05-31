import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:sequencer/modules/socket.dart';

class Base extends StatefulWidget {

  Offset position;
  final double width;
  final double height;
  final String name;
  final List<String> inputs;
  final List<String> outputs;
  final Widget child;

  Base({
    @required this.width, 
    @required this.height, 
    @required this.position,
    @required this.name, 
    @required this.inputs, 
    @required this.outputs,
    @required this.child
  });

  @override
  State<Base> createState() => _BaseState(
    position: position,
    width: width,
    height: height,
    name: name,
    inputs: inputs,
    outputs: outputs,
    child: child
  );

}

class _BaseState extends State<Base> {

  Offset position;
  final double width;
  final double height;
  final String name;
  final List<String> inputs;
  final List<String> outputs;
  final Widget child;

  _BaseState({
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
    return Transform(
        transform: Matrix4.translationValues(position.dx, position.dy, 0.0),
        child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            position += details.delta;
          });
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
    );
  }

}