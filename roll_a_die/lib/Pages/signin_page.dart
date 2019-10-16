import 'package:flutter/material.dart';
import 'dice-page.dart';
import '../authentication.dart';

class SignIn extends StatefulWidget {
  static String Id = 'login_page';
  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

class _SignIn extends State<SignIn> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future<void> signIn() async {
    // validate
    final formState = _formKey.currentState;

    if (formState.validate()) {
      formState.save();

      String userId = "";
      try {
        userId = await Auth().signIn(_email, _password);
        print('Signed in: $userId');

        if (userId.length > 0 && userId != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DiceApp()));
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                child: Image.asset(            
                  'images/dice4.png',            
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,            
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                child: Text(
                  'Roll a Die',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'please type email';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white ),
                  onSaved: (input) => _email = input.trim(),
                  decoration: InputDecoration(labelText: 'Email'),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'please type password';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white ),
                  onSaved: (input) => _password = input.trim(),
                  decoration: InputDecoration(labelText: 'password'),
                )
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('SignIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
