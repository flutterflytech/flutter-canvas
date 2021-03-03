import 'package:flutter/material.dart';
import 'my_page_routes.dart';
import 'detail_screen.dart';

main() {
  runApp(HeroAnimation());
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          body: HeroAnimationUI(),
        )),
        routes: {
          // "/": (context) => HeroAnimation(),
          MyPageRoutes.detailScreen: (context) => DetailScreen(),
        });
  }
}

class HeroAnimationUI extends StatefulWidget {
  @override
  _HeroAnimationUIState createState() => _HeroAnimationUIState();
}

class _HeroAnimationUIState extends State<HeroAnimationUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Hero(
        tag: "DemoTag",
        transitionOnUserGestures: true,

        flightShuttleBuilder:
            (flightContext, animation, direction, fromContext, toContext) {
          return Icon(
            Icons.add_a_photo_rounded,
            size: 150.0,
          );
        },
        child: Icon(
          Icons.add,
          size: 70.0,
        ),
      ),
    );
  }
}
