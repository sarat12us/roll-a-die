import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Pages/dice-page.dart';
import 'Pages/signin_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Roll a Die',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        DiceApp.Id: (context) => DiceApp(),
        SignIn.Id: (context) => SignIn(),
      },
      initialRoute:  SignIn.Id,
    );
  }
}

