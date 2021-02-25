import 'dart:ui';
import 'package:flutter/material.dart';
import 'animated_shape_painter.dart';
import 'my_animated_canvas.dart';

void main() {
  runApp(AnimatingCanvasShapes());
}

class AnimatingCanvasShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatingCanvasShapeUI(),
    );
  }
}

class AnimatingCanvasShapeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: MyAnimatedCanvas(),
    ));
  }
}
