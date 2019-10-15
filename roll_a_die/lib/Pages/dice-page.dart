import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../dice-item.dart';

class DiceApp extends StatefulWidget {
  static String Id = 'dice_page';
  @override
  _DiceApp createState() => _DiceApp();
}

class _DiceApp extends State<DiceApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..addListener(() => setState(() {
          diceItem.changeDice();
          //netDieImage = Random().nextInt(5) + 1;
        }));

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future animate() async {
    await animationController.forward(from: 0.0);
  }

  //int netDieImage = 1;
  DiceItem diceItem = new DiceItem();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            //elevation: 0.0,
            backgroundColor: Colors.redAccent,
            title: Text('RollAdie'),
          ),
          backgroundColor: Colors.redAccent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RotationTransition(
                  turns: animation,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: Image.asset('images/dice${diceItem.currentNumber}.png'),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                    ),
                  ),
                  onPressed: () {
                    animate();
                    setState(() {

                    });
                  },
                  child: Text(
                    'Roll',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
