import 'package:flutter/cupertino.dart';
import 'package:sequencer/modules/socket.dart';

class Base extends StatelessWidget {

  final double width;
  final double height;
  final double x;
  final double y;
  final String name;
  final List<String> inputs;
  final List<String> outputs;
  final Widget content;

  Base({
    @required this.width, 
    @required this.height, 
    @required this.x, 
    @required this.y, 
    @required this.name, 
    @required this.inputs, 
    @required this.outputs,
    @required this.content
  });
 
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(x, y, 0.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xff2c2c2c),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                child: content
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
    );

      
  }

}