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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (selected) {
                            selected = false;
                          } else {
                            selected = true;
                          }
                          _curveName = Curves.easeIn;
                          // print("Curve Name $_curveName $selected");
                        });
                      },
                      child: Text("Linear"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (selected) {
                            selected = false;
                          } else {
                            selected = true;
                          }
                          _curveName = Curves.fastOutSlowIn;
                          // print("Curve Name $_curveName $selected");
                        });
                      },
                      child: Text("Easy In Quint"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Linear"),
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                  width: selected ? 200.0 : 100.0,
                  height: selected ? 100.0 : 200.0,
                  color: selected ? Colors.white : Colors.blue,
                  alignment: selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: Duration(seconds: 2),
                  curve: Curves.decelerate,
                  onEnd: () {
                    print(_curveName);
                  },
                  child: Icon(Icons.account_balance)),
            ],
          ),
        ),
      ),
    );
  }
}
