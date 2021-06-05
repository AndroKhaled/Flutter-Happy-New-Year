import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'dart:ui';
import 'dart:ui' as ui;

class CountdownTimerPage extends StatefulWidget {
  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  CountdownTimerController controller;
  @override
  void initState() {
    super.initState();
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/count.jpg"),
                fit: BoxFit.cover,
              )
          ),
        ),

        CountdownTimer(
            controller: controller,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if (time == null) {

//                return IconButton(
//                  icon: Icon(Icons.favorite,color: Colors.pinkAccent,),
//                  iconSize: 150,
//
//                  onPressed: () {
//                    Navigator.of(context).pushNamed('/third');
//                  },
//                );
                return FlatButton(
                    onPressed: () {
                    Navigator.of(context).pushNamed('/third');
                  },

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Text("PRESS",style:TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:Colors.pinkAccent ,
                            decoration: TextDecoration.none)),
                        Icon(Icons.favorite,color: Colors.pinkAccent,size: 90,),
                        Text("ME",style:TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color:Colors.pinkAccent ,
                            decoration: TextDecoration.none)),
                      ],
                    ));
              }


              return Text(' ${time.sec}',style:TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color:Colors.pinkAccent ,
                  decoration: TextDecoration.none));
            },
          ),
        ],

      );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}