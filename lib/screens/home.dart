import 'package:flutter/material.dart';
import 'package:fluttering/widgets/frames/lastest_posts/lastest_posts.dart';

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
          BottomNavigationBarItem(icon: Icon(Icons.question_answer, color: Colors.blue,), title: Text('Forum')),
          BottomNavigationBarItem(icon: Icon(Icons.access_time, color: Colors.blue,), title: Text('Last activity')),
          BottomNavigationBarItem(icon: Icon(Icons.dvr, color: Colors.blue,), title: Text('Tutorials')),
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