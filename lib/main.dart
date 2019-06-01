import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fluttering/app_routes.dart';
import 'package:fluttering/screens/login_screen.dart';
=======
import 'package:fluttering/screens/create_post.dart';
>>>>>>> create post

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(routes);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
