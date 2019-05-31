import 'package:flutter/cupertino.dart';
import 'package:sequencer/curve_painter.dart';
import 'package:sequencer/modules/socket.dart';

class Wire extends StatefulWidget {

  double startX;
  double startY;
  double endX;
  double endY;

  Wire({
    @required this.startX, 
    @required this.startY, 
    @required this.endX, 
    @required this.endY
  });

  @override
  State<Wire> createState() => _WireState(
    startX: startX,
    startY: startY,
    endX: endX,
    endY: endX
  );
}

class _WireState extends State<Wire> {

  double startX;
  double startY;
  double endX;
  double endY;

  _WireState({
    @required this.startX, 
    @required this.startY, 
    @required this.endX, 
    @required this.endY
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
            startX: startX, 
            startY: startY, 
            endX: endX, 
            endY: endY,
            color: 0xffff7f17
          )
        ),
        Transform(
          transform: Matrix4.translationValues(startX - 7.0, startY - 7.0, 0.0),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                startX = startX + details.delta.dx;
                startY = startY + details.delta.dy;
              });
            },
            child: Socket(filled: true)
          )
        ),
        Transform(
          transform: Matrix4.translationValues(endX - 7.0, endY - 7.0, 0.0),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                endX = endX + details.delta.dx;
                endY = endY + details.delta.dy;
              });
            },
            child: Socket(filled: true)
          )
        )

      ],
    );
  }
  
}