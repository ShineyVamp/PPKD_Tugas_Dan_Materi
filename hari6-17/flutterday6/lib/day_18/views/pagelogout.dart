import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas7flutter.dart';
import 'package:flutterday6/TugasFlutter/tugas8page/tentang.dart';
import 'package:flutterday6/day_18/views/logout.dart';
import 'package:flutterday6/day_18/views/profile.dart';

class Tambahday18 extends StatefulWidget {
  const Tambahday18({super.key});

  @override
  State<Tambahday18> createState() => _Tambahday18State();
}

class _Tambahday18State extends State<Tambahday18> {
  int _currentindex = 0;
  void changeFooter(int index) {
    _currentindex = index;
    setState(() {});
  }

  final List<Widget> _pages = [
    Tugas7flutter(),
    Tentang(),
    DaftarPengguna(),
    Logout18(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        fixedColor: Colors.black,
        currentIndex: _currentindex,
        onTap: (value) {
          changeFooter(value);
        },
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Tentang"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Pengguna"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
      body: _pages.elementAt(_currentindex),
    );
  }
}
