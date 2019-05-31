import 'package:flutter/material.dart';
import 'dart:math';

const int DEFAULT_COLOR = 0xffff7fff;

class CurvePainter extends CustomPainter {

  Offset start;
  Offset end;
  int color;

  CurvePainter({
    @required this.start, 
    @required this.end, 
    this.color = DEFAULT_COLOR
  });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Color(color)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Path path = Path();
    path.moveTo(start.dx, start.dy);
    final Offset middle = new Offset(start.dx + (end.dx - start.dx) / 2, start.dy + (end.dy - start.dy) / 2);
    final double distance = sqrt(pow(end.dx - start.dx, 2) + pow(end.dy - start.dy, 2));


    path.quadraticBezierTo(
      middle.dx,
      middle.dy + distance * .25,
      end.dx, 
      end.dy
    );
    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}