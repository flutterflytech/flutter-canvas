import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class ShapePainter extends CustomPainter {
  double sides;
  double radius;
  double radians;

  ShapePainter(double side1, double radius1, double radians1) {
    sides = side1;
    radius = radius1;
    radians = radians1;
    //print(">>>> $sides $radius $radians");
  }

  @override
  void paint(Canvas canvas, Size size) {
    animateCircle(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  void animateCircle(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var path = Path();
    var angle = (math.pi * 2) / sides;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }
}
