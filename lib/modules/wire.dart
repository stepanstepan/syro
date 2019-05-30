import 'package:flutter/cupertino.dart';
import 'package:sequencer/curve_painter.dart';
import 'package:sequencer/modules/socket.dart';

class Wire extends StatelessWidget {

  Wire({@required this.startX, @required this.startY, @required this.endX, @required this.endY});
  final double startX;
  final double startY;
  final double endX;
  final double endY;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(
        startX: startX, 
        startY: startY, 
        endX: endX, 
        endY: endY,
        color: 0xffff7f17
      ),
      child: Stack(
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(startX - 7.0, startY - 7.0, 0.0),
            child: Socket(filled: true)
          ),
          Transform(
            transform: Matrix4.translationValues(endX - 7.0, endY - 7.0, 0.0),
            child: Socket(filled: true)
          )
        ],
      )
    );
  }
  
}