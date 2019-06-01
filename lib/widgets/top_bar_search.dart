import 'package:flutter/material.dart';

var topBar = AppBar(
  title: Text("Search"),
  actions: <Widget>[
  ],
  backgroundColor: Colors.blueAccent,
  elevation: 10,
  leading: IconButton(
    icon: Icon(Icons.search),
    onPressed: (){},
  ),
);