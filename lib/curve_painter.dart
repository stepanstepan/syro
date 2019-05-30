import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {

  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final int color;

  CurvePainter({
    @required this.startX, 
    @required this.startY, 
    @required this.endX, 
    @required this.endY,
    this.color = 0xffff7fff
  });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Color(color)
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