import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas3flutter.dart';
import 'package:flutterday6/TugasFlutter/tugas4flutter.dart';
import 'package:flutterday6/TugasFlutter/tugas5flutter.dart';
import 'package:flutterday6/day_13/input_widget/input_widget.dart';
import 'package:flutterday6/day_15/list.dart';
import 'package:flutterday6/day_15/list_model.dart';
import 'package:flutterday6/day_15/list_of_map.dart';
import 'package:flutterday6/extension/navigation.dart';

class DrawerDay13 extends StatefulWidget {
  const DrawerDay13({super.key});

  @override
  State<DrawerDay13> createState() => _DrawerDay13State();
}

class _DrawerDay13State extends State<DrawerDay13> {
  int _selectedButton = 0;
  void changeButton(int index) {
    _selectedButton = index;
    print("Ini adalah value dari : $_selectedButton");
    setState(() {});
    context.pop();
  }

  final List<Widget> _widgetOptions = [
    Tugas3flutter(),
    Tugas4Flutter(),
    Tugas5flutter(),
    InputWidgetDay13(),
    ListDataDay13(),
    ListOfMapDay13(),
    ListOfModelDay13(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("data"),
              onTap: () {
                changeButton(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("data"),
              onTap: () {
                changeButton(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("data"),
              onTap: () {
                changeButton(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Input Widget"),
              onTap: () {
                changeButton(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("List Data"),
              onTap: () {
                changeButton(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("List Map"),
              onTap: () {
                changeButton(5);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("List Model"),
              onTap: () {
                changeButton(6);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedButton),
    );
  }
}
