import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Hero(
          tag: "DemoTag",
          child: Icon(
            Icons.add,
            size: 150.0,
          ),
        ),
      ),
    );
  }
}
