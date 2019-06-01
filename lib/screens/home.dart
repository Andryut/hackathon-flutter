import 'package:flutter/material.dart';
import 'package:fluttering/widgets/frames/lastest_posts/lastest_posts.dart';
import 'package:fluttering/widgets/frames/settings/settings.dart';

class Home extends StatefulWidget{

  Home({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {

  //App bodies routes
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0'),
    LastestPosts(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.plus_one, color: Colors.blue,), title: Text('Create New Post')),
          BottomNavigationBarItem(icon: Icon(Icons.access_time, color: Colors.blue,), title: Text('Last activity')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.blue,), title: Text('Account')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}