import 'package:flutter/material.dart';

var topBar = AppBar(
  title: Text("Search"),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.account_circle),
      onPressed: (){

      },
    ),
  ],
  backgroundColor: Colors.blueAccent,
  elevation: 10,
  leading: IconButton(
    icon: Icon(Icons.search),
    onPressed: (){},
  ),
);