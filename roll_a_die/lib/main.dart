import 'package:flutter/material.dart';

import 'Pages/dice-page.dart';
import 'Pages/login_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Articles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        DiceApp.Id: (context) => DiceApp(),
        LoginPage.Id: (context) => LoginPage(),
      },
      initialRoute:  LoginPage.Id,
    );
  }
}

