import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_body.dart';
import 'home_history.dart';
import 'home_profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            buildNavBarItem(Icons.home, 0),
            buildNavBarItem(Icons.add_chart, 1),
            buildNavBarItem(Icons.person, 2),
          ],
        ),
        body:_selectedIndex==0?HomeBody():_selectedIndex==1?HomeHistory():HomeProfile(),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 4, color: Colors.blue)),
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.blue.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        //color: index == _selectedIndex ? Colors.blue : Colors.white,
        child: Icon(icon,
        color:  index == _selectedIndex ? Colors.blue : Colors.black ,
        ),
      ),
    );
  }
}
