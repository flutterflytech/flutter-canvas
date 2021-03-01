import 'package:Canvas/animatedcanvas/animated_shape_painter.dart';
import 'package:flutter/rendering.dart';
import 'animated_canvas_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math'; // will not work
import 'dart:math' as math; // will work
import 'package:fluttertoast/fluttertoast.dart';

class MyAnimatedCanvas extends StatefulWidget {
  @override
  _MyAnimatedCanvasState createState() => _MyAnimatedCanvasState();
}

class _MyAnimatedCanvasState extends State<MyAnimatedCanvas>
    with TickerProviderStateMixin {
  var _sides = 6.0;
  var _radius = 100.0;
  Animation<double> animation;
  AnimationController controller;
  String infoText = "";
  Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 900),
    );

    Tween<double> _radiusTween = Tween(begin: 0.0, end: 590);
    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    animation = _radiusTween.animate(controller)
      ..addListener(() {
        setState(() {
          // print("SET STATE " + controller.upperBound.toString());
          // print("SET STATE Velocity " + controller.velocity.toString());
          // print("SET STATE " + controller.upperBound.toString());
        });
      })
      ..addStatusListener((status) {
        // print("Value >>>>: $controller.value ");
        print(controller.value);
        print(controller.animationBehavior);
        print(controller.debugLabel);
        print(controller.duration);
        print(controller.isAnimating);
        print(controller.lastElapsedDuration);
        print(controller.lowerBound);
        print(controller.velocity);
        print(controller.reverseDuration);
        print(controller.upperBound);
        print(controller.view);
        print(controller.isCompleted);
        print(controller.isDismissed);
        if (status == AnimationStatus.completed) {
          print("Completed...>>>>>>>>>>>>>>>>> " + animation.value.toString());
          //controller.stop();
          infoText += "\n" + controller.status.toString();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          print("Dismissed...>>>>>>>>>>>>>>>>>>" + animation.value.toString());
          controller.forward();
        }
      });
    //   controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    infoText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(top: 58.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (!controller.isAnimating) {
                        controller.forward();
                        infoText = "\nStarted in Forward Direction";
                      }
                    });
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (controller.isAnimating) {
                        controller.stop();
                        infoText = "";
                        infoText += "\nStopped";
                      }
                    });
                  },
                  child: Text(
                    "Stop",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    controller.reverse();
                    setState(() {
                      infoText = "\nStarted in Reverse Direction";
                    });
                  },
                  child: Text(
                    "Reverse",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(108.0),
              child: CustomPaint(
                painter: ShapePainter(
                    _sides, _radius, animation.value), // sides,radius,radians
                child: Container(),
              ),
            ),
            Text(
              infoText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sides : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                    autofocus: false,
                    min: 0.0, // minimum Value
                    activeColor: Colors.red,
                    inactiveColor: Colors.amber,
                    max: 20,
                    divisions: 15,
                    value: _sides,
                    onChanged: (val) {
                      setState(() {
                        _sides = val;
                        //infoText += "";
                        //infoText += _sides.toString();
                        print("Sides>>>>>>>>> $_sides");
                      });
                    }),
                Text((_sides + 1).toInt().toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
