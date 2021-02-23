import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'ShapePainter.dart';

void main() {
  runApp(CanvasPractice());
}

class CanvasPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: CanvasPracticeUI(),
        ),
      ),
    );
  }
}

class CanvasPracticeUI extends StatefulWidget {
  @override
  _CanvasPracticeUIState createState() => _CanvasPracticeUIState();
}

class _CanvasPracticeUIState extends State<CanvasPracticeUI> {
  int shape_type = -1;
  String shapeName = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 0) {
                      shape_type = 0;
                      shapeName = "Line";
                    }
                  });
                },
                child: Text("Line"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 1) {
                      shape_type = 1;
                      shapeName = "Stroke Circle";
                    }
                  });
                },
                child: Text("Stroke Circle"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 2) {
                      shape_type = 2;
                      shapeName = "Rectangle";
                    }
                  });
                },
                child: Text("Rectangle"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 3) {
                      shape_type = 3;
                      shapeName = "Arc";
                    }
                  });
                },
                child: Text("Arc"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 4) {
                      shape_type = 4;
                      shapeName = "Triangle";
                    }
                  });
                },
                child: Text("Triangle"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 5) {
                      shapeName = "Points";
                      shape_type = 5;
                    }
                  });
                },
                child: Text("Plot Ploints"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shape_type != 6) {
                      shapeName = "Bezier";
                      shape_type = 6;
                    }
                  });
                },
                child: Text("Draw Bezier"),
              ),
            ],
          ),
          CustomPaint(
            painter: ShapePainter(shape_type, shapeName),
            child: Container(),
          ),
          Text(
            shapeName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
