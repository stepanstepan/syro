import 'package:flutter/cupertino.dart';
import 'package:sequencer/curve_painter.dart';
import 'package:sequencer/modules/socket.dart';

class Wire extends StatefulWidget {

  Offset start;
  Offset end;

  Wire({
    @required this.start, 
    @required this.end
  });

  @override
  State<Wire> createState() => _WireState(
    start: start,
    end: end
  );
}

class _WireState extends State<Wire> {

  Offset start;
  Offset end;

  _WireState({
    @required this.start, 
    @required this.end
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
            start: start,
            end: end,
            color: 0xffff7f17
          )
        ),
        Transform(
          transform: Matrix4.translationValues(start.dx - 7.0, start.dy - 7.0, 0.0),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                start += details.delta;
              });
            },
            child: Socket(filled: true)
          )
        ),
        Transform(
          transform: Matrix4.translationValues(end.dx - 7.0, end.dy - 7.0, 0.0),
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                end += details.delta;
              });
            },
            child: Socket(filled: true)
          )
        )

      ],
    );
  }
  
}