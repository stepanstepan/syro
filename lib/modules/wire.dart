import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:sequencer/curve_painter.dart';
import 'package:sequencer/modules/socket.dart';

class Wire extends StatelessWidget {

  final Offset source;
  final Offset target;

  Wire({
    @required this.source, 
    @required this.target
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(),
        CustomPaint(
          isComplex: true, 
          willChange: true,
          painter: CurvePainter(
            start: source,
            end: target,
            color: 0xffff7f17
          )
        ),
        Transform(
          transform: Matrix4.translationValues(source.dx - 7.0, source.dy - 7.0, 0.0),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              // setState(() {
              //   start += details.delta;
              // });
            },
            child: Socket(filled: true)
          )
        ),
        Transform(
          transform: Matrix4.translationValues(target.dx - 7.0, target.dy - 7.0, 0.0),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              // setState(() {
              //   end += details.delta;
              // });
            },
            child: Socket(filled: true)
          )
        )

      ],
    );
  }
  
}