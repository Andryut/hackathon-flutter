import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  Widget _makeSignInButtton(BuildContext context) {
    return ButtonTheme(
      minWidth: 180.0,
      child: RaisedButton(
        onPressed: () => Navigator.pushNamed(context, 'login-screen'),
        child: const Text(
          'SIGN IN',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.lightBlueAccent[400],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  Widget _makeSignUpButton(BuildContext context) {
    return ButtonTheme(
      minWidth: 180.0,
      child: RaisedButton(
        onPressed: () => Navigator.pushNamed(context, 'register-screen'),
        child: const Text(
          'SIGN UP',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.blue[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _giveMeALogo() {
    return Image.asset('assets/flutter-icon.png');
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _giveMeALogo(),
          _makeSignInButtton(context),
          _makeSignUpButton(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
        body: _buildBody(context));
  }
}
