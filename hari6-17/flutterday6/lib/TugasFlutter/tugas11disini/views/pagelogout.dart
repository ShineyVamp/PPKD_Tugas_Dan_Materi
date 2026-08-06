import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas11disini/views/logout.dart';
import 'package:flutterday6/TugasFlutter/tugas7flutter.dart';
import 'package:flutterday6/TugasFlutter/tugas8page/tentang.dart';

class TambahTugas11 extends StatefulWidget {
  const TambahTugas11({super.key});

  @override
  State<TambahTugas11> createState() => _TambahTugas11State();
}

class _TambahTugas11State extends State<TambahTugas11> {
  int _currentindex = 0;
  void changeFooter(int index) {
    _currentindex = index;
    setState(() {});
  }

  final List<Widget> _pages = [Tugas7flutter(), Tentang(), Logout()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (value) {
          changeFooter(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Tentang"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
      body: _pages.elementAt(_currentindex),
    );
  }
}
