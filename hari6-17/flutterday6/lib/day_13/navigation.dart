import 'package:flutter/material.dart';
import 'package:flutterday6/day_11/home_2.dart';
import 'package:flutterday6/day_11/routing.dart';
import 'package:flutterday6/day_6/image.dart';

class NavigationDay11 extends StatefulWidget {
  const NavigationDay11({super.key});

  @override
  State<NavigationDay11> createState() => _NavigationDay11State();
}

class _NavigationDay11State extends State<NavigationDay11> {
  int _selectedButton = 0;
  void changeButton(int index) {
    _selectedButton = index;
    print("Ini adalah value dari : $_selectedButton");
    setState(() {});
  }

  final List<Widget> _widgetOptions = [
    RoutingDay11(),
    ImageDay6(),
    HomeRouting2Day11(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("data"), centerTitle: true),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedButton,
        onTap: (value) {
          changeButton(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Name"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
        ],
      ),

      body: _widgetOptions.elementAt(_selectedButton),
    );
  }
}
