import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {

  CurvePainter({@required this.startX, @required this.startY, @required this.endX, @required this.endY});
  final double startX;
  final double startY;
  final double endX;
  final double endY;

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Color(0xffff7f17)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Path path = Path();
    path.moveTo(startX, startY);
    path.cubicTo(startX, endY, endX, startY, endX, endY);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}