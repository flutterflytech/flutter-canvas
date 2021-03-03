import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatingButton(),
    );
  }
}

class AnimatingButton extends StatefulWidget {
  @override
  AnimatingButtonState createState() {
    return new AnimatingButtonState();
  }
}

class AnimatingButtonState extends State<AnimatingButton>
    with TickerProviderStateMixin {
  //Uses a Ticker Mixin for Animations
  Animation<double> _animation;
  AnimationController _animationController;

  Animation<double> _animation1;
  AnimationController _animationController1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            2)); //specify the duration for the animation & include `this` for the vsyc
    _animation = Tween<double>(begin: 1.0, end: 2.5).animate(
        _animationController); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation.addListener(() {
      //here, a listener that rebuilds our widget tree when animation.value chnages
      setState(() {});
    });

    _animation.addStatusListener((status) {
      //AnimationStatus gives the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {
        _animationController
            .reverse(); //reverse the animation back here if its completed
      }
    });

    _animationController1 = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            2)); //specify the duration for the animation & include `this` for the vsyc
    _animation1 = Tween<double>(begin: 1.0, end: 2.5).animate(
        _animationController1); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation1.addListener(() {
      //here, a listener that rebuilds our widget tree when animation.value chnages
      setState(() {});
    });

    _animation1.addStatusListener((status) {
      //AnimationStatus gives the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {
        _animationController1
            .reverse(); //reverse the animation back here if its completed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animating a Button'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: ButtonTheme(
              minWidth: 88.0 *
                  _animation1
                      .value, //multiply the static width value with current animation.value value
              height: 36.0 *
                  _animation1
                      .value, //multiply the static height value with current animation.value value
              child: RaisedButton(
                child: Text('Tap this button to  Animate Button below '),
                onPressed: () {
                  _animationController
                      .forward(); // tapping the button, starts the animation.
                },
              ),
            ),
          ),
          Center(
            child: ButtonTheme(
              minWidth: 88.0 *
                  _animation
                      .value, //multiply the static width value with current animation.value value
              height: 36.0 *
                  _animation
                      .value, //multiply the static height value with current animation.value value
              child: RaisedButton(
                child: Text('Tap this button to Animate Button on top'),
                onPressed: () {
                  _animationController.stop();
                  // _animationController1.forward();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
