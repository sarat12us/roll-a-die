import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  static String Id = 'login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User ID',
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MaterialButton(
                        minWidth: double.maxFinite, // set minWidth to maxFinite
                        color: Colors.blue,
                        onPressed: () {},
                        child: Text("Login"),
                      )
                    ),
//                    Padding(
//                        padding: const EdgeInsets.all(12.0),
//                        child: MaterialButton(
//                          minWidth: double.maxFinite, // set minWidth to maxFinite
//                          color: Colors.blue,
//                          onPressed: () {},
//                          child: Row(
//                            children: <Widget>[
//                              Icon(Icons.add_circle),
//                              SizedBox(width: 100,),
//                              Text("Google Sign-in"),
//                            ],
//                          ),
//                        )
//                    )
                  ],
                ),
              ),
      ),
    );
  }
}

