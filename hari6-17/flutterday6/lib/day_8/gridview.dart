import 'package:flutter/material.dart';

class GridviewDay8 extends StatelessWidget {
  const GridviewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E8A2),
      appBar: AppBar(
        title: Text("GridView Say8"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 91, 255, 236),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}
