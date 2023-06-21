import 'package:flutter/material.dart';
import 'package:flutter_application_rpl/Hasil.dart';
import 'package:flutter_application_rpl/beranda.dart';
import 'package:flutter_application_rpl/pdi.dart';
import 'package:flutter_application_rpl/login.dart';
import 'package:flutter_application_rpl/profile.dart';

void main() => runApp(HalamanUtama());

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EVotingHomePage(),
    );
  }
}

class EVotingHomePage extends StatefulWidget {
  @override
  _EVotingHomePageState createState() => _EVotingHomePageState();
}

class _EVotingHomePageState extends State<EVotingHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    hasil(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Hasil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
