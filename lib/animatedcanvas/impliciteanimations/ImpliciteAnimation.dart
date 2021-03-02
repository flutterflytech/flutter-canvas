import 'package:flutter/material.dart';

main() {
  runApp(ImpliciteAnimation());
}

class ImpliciteAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImpliciteAnimationUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImpliciteAnimationUI extends StatefulWidget {
  @override
  _ImpliciteAnimationUIState createState() => _ImpliciteAnimationUIState();
}

class _ImpliciteAnimationUIState extends State<ImpliciteAnimationUI> {
  Curve _curveName;
  bool selected = false;
  double padValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding"),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (padValue != 150.0) {
                        padValue = 150.0;
                      } else {
                        padValue = 0;
                      }
                      print(padValue);
                    });
                  },
                  child: Text(
                    "Animate",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: Duration(seconds: 2),
              curve: Curves.linear,
              child: Container(
                height: 50,
                width: 250,
                color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
