import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttering/data/session.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _currentEmail = TextEditingController();
  final _currentPassword = TextEditingController();
  String _inputState = "";

  void _handleSignInError() {
    setState(() {
      _currentEmail.clear();
      _currentPassword.clear();
      _inputState = "can't login with the provided credentials";
    });
  }

  Widget _makeEmailBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: TextFormField(
        controller: _currentEmail,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _makePasswordBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 0.0,
      ),
      child: TextFormField(
        controller: _currentPassword,
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _makeErrorBox() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        _inputState,
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.red,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _makeLoginButtton() {
    return RaisedButton(
      onPressed: () {
                if (_currentEmail.text != '' && _currentEmail.text != '') {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _currentEmail.text,
                          password: _currentPassword.text)
                      .then((user) {
                    Session().user = user;
                    Navigator.pushNamed(context, 'home-screen');
                  }).catchError(() => _handleSignInError());
                } else {
                  setState(() {
                    _inputState = 'email and password needed';
                  });
                }
              },
      child: const Text(
        'login',
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      color: Colors.lightBlueAccent[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  Widget _makeSignUpButton() {
    return RaisedButton(
      onPressed: () => Navigator.pushNamed(context, 'register-screen'),
      child: const Text(
        'sign up',
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      color: Colors.blue[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _makeEmailBox(),
        SizedBox(
          height: 15.0,
        ),
        _makePasswordBox(),
        _makeErrorBox(),
        _makeLoginButtton(),
        _makeSignUpButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.blue)),
        body: _buildBody());
  }
}
