import 'package:flutter/material.dart';
import 'package:fluttering/screens/login_screen.dart';
import 'package:fluttering/screens/register_screen.dart';
import 'package:fluttering/screens/main_screen.dart';
import 'package:fluttering/screens/home.dart';

final routes = <String, WidgetBuilder>{
  'login-screen': (context) => LoginScreen(),
  'register-screen': (context) => RegisterScreen(),
  'main-screen': (context) => MainScreen(),
  'home-screen': (context) => Home(),
};
