import 'dart:math';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:celebration/countdown_timer_page.dart';
import 'package:celebration/zero.dart';

void main() => runApp(const ConfettiSample());

class ConfettiSample extends StatelessWidget {


  const ConfettiSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Open Me',
        routes: <String,WidgetBuilder>{
          '/First':(BuildContext context)=>new CountdownTimerPage(),
          '/Second':(BuildContext context)=>new ConfettiSample(),
          '/third':(BuildContext context)=>new zero(),
        },

        home: Scaffold(
          body: CountdownTimerPage(
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
      ],
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
//-----------------------------------------------
  Widget buildItem(String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return page;
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        child: Text(title, style: TextStyle(fontSize: 36),),
      ),
    );
  }
}
