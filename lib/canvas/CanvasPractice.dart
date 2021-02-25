import 'dart:ui';

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
          appBar: AppBar(
            title: Text("Flutter Canvas"),
          ),
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
  int shapeType = -1;
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
                    if (shapeType != 0) {
                      shapeType = 0;
                      shapeName = "Line";
                    }
                  });
                },
                child: Text("Line"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shapeType != 1) {
                      shapeType = 1;
                      shapeName = "Stroke Circle";
                    }
                  });
                },
                child: Text("Stroke Circle"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shapeType != 2) {
                      shapeType = 2;
                      shapeName = "Rectangle";
                    }
                  });
                },
                child: Text("Rectangle"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shapeType != 3) {
                      shapeType = 3;
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
                    if (shapeType != 4) {
                      shapeType = 4;
                      shapeName = "Triangle";
                    }
                  });
                },
                child: Text("Triangle"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shapeType != 5) {
                      shapeName = "Points";
                      shapeType = 5;
                    }
                  });
                },
                child: Text("Plot Points"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if (shapeType != 6) {
                      shapeName = "Bezier";
                      shapeType = 6;
                    }
                  });
                },
                child: Text("Draw Bezier"),
              ),
            ],
          ),
          CustomPaint(
            painter: ShapePainter(shapeType, shapeName),
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
