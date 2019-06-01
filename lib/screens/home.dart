import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  Home({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {

  //App bodies routes
  int _selectedIndex = 0;
  final _widgetOptions = [
    Text('Index 0'),
    Text('Index 1'),
    Text('Index 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.question_answer, color: Colors.blue,), title: Text('Chat')),
          BottomNavigationBarItem(icon: Icon(Icons.people, color: Colors.blue,), title: Text('Events')),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.blue,), title: Text('Settings')),
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