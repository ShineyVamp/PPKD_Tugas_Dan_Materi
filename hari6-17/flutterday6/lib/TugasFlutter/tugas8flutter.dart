import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas7flutter.dart';
import 'package:flutterday6/TugasFlutter/tugas8page/tentang.dart';

class Tugas8flutter extends StatefulWidget {
  const Tugas8flutter({super.key});

  @override
  State<Tugas8flutter> createState() => _Tugas8flutterState();
}

class _Tugas8flutterState extends State<Tugas8flutter> {
  int _currentindex = 0;
  void changeFooter(int index){
    _currentindex = index;
    setState(() {
      
    });
  }
  final List <Widget> _pages = [
    Tugas7flutter(),
    Tentang()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (value) {
          changeFooter(value);
        },
        items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"), BottomNavigationBarItem(icon: Icon(Icons.info), label: "Tentang")]),
        body: _pages.elementAt(_currentindex),
    );
  }
}