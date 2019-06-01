import 'package:flutter/material.dart';
import 'package:fluttering/screens/login_screen.dart';
import 'package:fluttering/screens/register_screen.dart';
import 'package:fluttering/screens/main_screen.dart';

final routes = <String, WidgetBuilder>{
  'login-screen': (context) => LoginScreen(),
  'register-screen': (context) => RegisterScreen(),
  'main-screen': (context) => MainScreen(),
};
