import 'package:flutter/material.dart';
import 'package:fluttering/routes/app_routes.dart';
import 'package:fluttering/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(routes);
    return MaterialApp(
      title: 'Fluttering',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
