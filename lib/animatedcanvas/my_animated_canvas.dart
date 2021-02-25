import 'package:Canvas/animatedcanvas/animated_shape_painter.dart';

import 'animated_canvas_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math'; // will not work
import 'dart:math' as math; // will work

class MyAnimatedCanvas extends StatefulWidget {
  @override
  _MyAnimatedCanvasState createState() => _MyAnimatedCanvasState();
}

class _MyAnimatedCanvasState extends State<MyAnimatedCanvas>
    with TickerProviderStateMixin {
  var _sides = 3.0;
  Animation<double> animation;
  AnimationController controller;

  Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(">>>>>>>>>>initState");
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 900),
    );

    Tween<double> _radiusTween = Tween(begin: 0.0, end: 590);
    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    animation = _radiusTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("Completed...>>>>>>>>>>>>>>>>> " + animation.value.toString());
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          print("Dismissed...>>>>>>>>>>>>>>>>>>" + animation.value.toString());
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      // color: Colors.red,
      child: CustomPaint(
        painter: ShapePainter(3, 103, animation.value), // sides,radius,radians
        child: Container(),
      ),
    );
  }
}
