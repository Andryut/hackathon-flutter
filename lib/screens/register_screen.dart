import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttering/data/session.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _currentName = TextEditingController();
  final _currentLastName = TextEditingController();
  final _currentEmail = TextEditingController();
  final _currentPassword = TextEditingController();
  final _currentConfirmationPassword = TextEditingController();
  bool _isChecked = false;
  String _inputState = '';

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  void _handleSignUpError() {
    setState(() {
      _currentName.clear();
      _currentLastName.clear();
      _currentEmail.clear();
      _currentPassword.clear();
      _currentConfirmationPassword.clear();
      _inputState = "can't create user with the provided credentials";
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.blue)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: TextFormField(
                controller: _currentName,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ), //nameField

            SizedBox(
              height: 15.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 0.0,
              ),
              child: TextFormField(
                controller: _currentLastName,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'last name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ), //lastNameField

            SizedBox(
              height: 20.0,
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: TextFormField(
                controller: _currentEmail,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ), //emailField

            SizedBox(
              height: 15.0,
            ),

            Padding(
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ), //passwordField

            SizedBox(
              height: 20.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 0.0,
              ),
              child: TextFormField(
                controller: _currentConfirmationPassword,
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'confirm password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ), //passwordConfirmationField

            SizedBox(
              height: 20.0,
            ),

            Row(
              children: <Widget>[
                Container(
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (bool value) {
                      onChanged(value);
                    },
                  ), ////radioButton
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      "accept ",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // active privacy link
                    },
                    child: Text(
                      "privacy policy",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ), //forgotPassword
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                _inputState,
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 180.0,
              child: RaisedButton(
                onPressed: () {
                  if (_currentName.text != '' &&
                      _currentLastName.text != '' &&
                      _currentEmail.text != '' &&
                      _currentPassword.text != '' &&
                      _currentConfirmationPassword.text != '') {
                    if (_currentPassword.text ==
                        _currentConfirmationPassword.text) {
                      if (_isChecked) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _currentEmail.text,
                                password: _currentPassword.text)
                            .then((user) {
                          Firestore.instance.collection('users').add({
                            'displayName':
                                _currentName.text + ' ' + _currentLastName.text,
                            'email': _currentEmail.text,
                            'uid': user.uid,
                          });
                          Session().user = user;
                          Session().name = _currentName.text;
                          Navigator.pushNamed(context, 'home-screen');
                        }).catchError((error) => _handleSignUpError());
                      } else {
                        setState(() {
                          _inputState = 'must agree the privacy policy';
                        });
                      }
                    } else {
                      setState(() {
                        _inputState = 'bad password comfirmation';
                      });
                    }
                  } else {
                    setState(() {
                      _inputState = 'all the fields are required';
                    });
                  }
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.lightBlueAccent[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
