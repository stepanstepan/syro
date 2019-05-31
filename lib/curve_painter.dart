import 'package:flutter/material.dart';
import 'dart:math';

const int DEFAULT_COLOR = 0xffff7fff;

class CurvePainter extends CustomPainter {

  double startX;
  double startY;
  double endX;
  double endY;
  int color;

  CurvePainter({
    @required this.startX, 
    @required this.startY, 
    @required this.endX, 
    @required this.endY,
    this.color = DEFAULT_COLOR
  });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Color(color)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Path path = Path();
    path.moveTo(startX, startY);
    // path.cubicTo(startX, endY, endX, startY, endX, endY);
    final Offset middle = new Offset(startX + (endX - startX) / 2, startY + (endY - startY) / 2);
    final double distance = sqrt(pow(endX - startX, 2) + pow(endY - startY, 2));
    // final double arc = atan((middle.dx - startX) / (middle.dy - startY));

    path.quadraticBezierTo(
      middle.dx,
      middle.dy + distance * .25,
      endX, 
      endY
    );
    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}