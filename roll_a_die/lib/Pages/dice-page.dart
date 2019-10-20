import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:roll_a_die/dice_store.dart';

import '../dice-item.dart';

class DiceApp extends StatefulWidget {
  static String Id = 'dice_page';
  String uid;
  @override
  _DiceApp createState() => _DiceApp();
}

class _DiceApp extends State<DiceApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    diceStore.initialize();
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

  Future stopDie() async {
    Future.delayed(Duration(seconds: 5),
            () => diceStore.stopDice(widget.uid, diceItem.currentNumber));
  }

  _showPrivacyPolicy() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Warning"),
            content: Text("you can`t play right now"),
            actions: <Widget>[
              InkWell(
                child: Text("Ok"),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }

  //int netDieImage = 1;
  DiceItem diceItem = new DiceItem();
  DiceStore diceStore = new DiceStore();

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
          body: StreamBuilder(
            stream: Firestore.instance.collection('dice_result').snapshots(),
            builder: (context, snapshot) {
              return Column(
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
                      onPressed: () async{
                        var a = await diceStore.getDiceResult();
                        if(a=="play"){
                          _showPrivacyPolicy();
                        }
                        else{
                          diceStore.playDice(widget.uid);
                          animate();
                          stopDie();
                        }
                        setState(() {});
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
              );
            }
          ),
        )
    );
  }
}
