import 'dart:ui';
import 'package:flutter/material.dart';
import 'AnimatedShapePainter.dart';

void main() {
  runApp(AnimatingCanvasShapes());
}

class AnimatingCanvasShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatingCanvasShapeScreen(),
    );
  }
}

class AnimatingCanvasShapeScreen extends StatefulWidget {
  @override
  _AnimatingCanvasShapeScreenState createState() =>
      _AnimatingCanvasShapeScreenState();
}

class _AnimatingCanvasShapeScreenState
    extends State<AnimatingCanvasShapeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Canvas Animation"),
      ),
      body: AnimShapeUI(),
    );
  }
}

class AnimShapeUI extends StatefulWidget {
  @override
  _AnimShapeUIState createState() => _AnimShapeUIState();
}

class _AnimShapeUIState extends State<AnimShapeUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: CustomPaint(
        painter: AnimatedShapePainter(),
        child: Container(),
      ),
    );
  }
}
