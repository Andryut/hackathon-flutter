import 'package:flutter/material.dart';

var exploreTitle = Container(
  child: Text(
    'Explore last activity:',
    style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold
    ),
  ),
  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
);

var newPostButton = Container(
  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
  child: FlatButton(
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    color: Colors.blueAccent,
    textColor: Colors.white,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.black,
    padding: EdgeInsets.all(8.0),
    splashColor: Colors.blueAccent,
    onPressed: () {
      /*...*/
    },
    child: Text(
      "Create new post",
      style: TextStyle(fontSize: 17.0),
    ),
  ),
);