import 'package:flutter/material.dart';
import 'my_page_routes.dart';
import 'detail_screen.dart';

main(){
  runApp(HeroAnimation());
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
        child: Scaffold(body: HeroAnimationUI(),)), routes: {
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
      height: MediaQuery.of(context).size.height*1,
      width:  MediaQuery.of(context).size.width*1,
      child:  FlatButton(child: Text("Click"),color: Colors.red,),
    );
  }
}
