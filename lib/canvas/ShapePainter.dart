import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  int shape_type;
  String shapeName = "";

  ShapePainter(int shape_type1, String shapeName1) {
    shape_type = shape_type1;
    shapeName = shapeName1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print("paint>>>> $canvas Size : $size");
    print(shape_type);
    switch (shape_type) {
      case 0:
        drawLine(canvas, size);

        break;
      case 1:
        createCircle(canvas, size, 65);
        break;
      case 2:
        createRectangle(canvas, size, Colors.green, 1.0);
        break;
      case 3:
        drawArc(canvas, size, Colors.red, Colors.green, 2);
        break;
      case 4:
        drawTriangle(canvas, size);
        break;
      case 5:
        plotPoints(canvas, size);
        // drawColor(canvas, size);
        break;
      case 5:
        plotPoints(canvas, size);
        // drawColor(canvas, size);
        break;
      default:
        print("DEFAULT");
    }

    // drawPathRavi(canvas,size,Colors.orange,Colors.red,Colors.green,4);
    // drawTriangle(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    print("Old Delegate>> $oldDelegate");
    // return oldDelegate != this;
    return true;
  }

  void drawLine(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
    paint.strokeWidth = 1.0; // Defines the Thickness of the shape
    // Offset start = Offset(0, size.height / 2); // Sets the starting coordinate
    // Offset end = Offset(size.width, size.height / 2);

    Offset start = Offset(10, 260); // Sets the starting coordinate
    Offset end = Offset(size.width - 10, 260);
    canvas.drawLine(start, end, paint);
  }

  void createCircle(Canvas canvas, Size size, double radius) {
    var paint = Paint();
    paint.color = Colors.deepOrange;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    Offset offset = Offset(size.width / 2, 300);
    canvas.drawCircle(offset, radius, paint);
    canvas.save();
  }

  void createRectangle(
      Canvas canvas, Size size, Color color, double strokeWidth) {
    var paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.color = color;
    paint.strokeWidth = strokeWidth;
    canvas.drawRect(Offset((size.width / 2) - 40, 210) & Size(80, 80), paint);
  }

  void drawArc(Canvas canvas, Size size, Color colorThree, Color color,
      double strokeWidth) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    final rect = Rect.fromLTRB(50, 100, 250, 200); // (left,top,right,bottom)
    canvas.drawArc(rect, 1, 2, false, paint);
  }

  void drawPathRavi(Canvas canvas, Size size, Color colorThree, Color colorTwo,
      Color color, double strokeWidth) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.17, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.50, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);
    path.close();

    paint.color = colorThree;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorTwo;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.22, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
        size.width * 0.40, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
        size.width * 0.65, size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.amberAccent; //colorOne;
    canvas.drawPath(path, paint);
  }

  void drawTriangle(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.deepOrange;
    // paint.strokeWidth = 2.0;
    var path = Path();
    path.moveTo(50, 34);
    path.lineTo(34, 145);
    path.lineTo(44, 145);
    path.lineTo(74, 145);
    path.close();
    canvas.drawPath(path, paint);
  }

  void drawColor(Canvas canvas, Size size) {
    print("Draw Color>>");
    canvas.skew(23, 12);
  }

  void plotPoints(Canvas canvas, Size size) {
    var paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    var points = [
      Offset(size.width / 2, 190),
      Offset(size.width / 2 - 34, 228),
      Offset(size.width / 2 + 34, 228),
      Offset(size.width / 2, 270),
      Offset(size.width / 2, 290),
      Offset(size.width / 2 + 90, 270),
    ];
    canvas.drawPoints(PointMode.points, points, paint);
  }

  void drawQuadraticBezier(Canvas canvas, Size size) {
    var paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    var path = Path();
    path.moveTo(20, 20);
    path.quadraticBezierTo(40, 40, 80, 100);
    canvas.drawPath(path, paint);
  }
}
