import 'package:flutter/material.dart';

class Singlechildscrollviewday8 extends StatelessWidget {
  const Singlechildscrollviewday8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E8A2),
      appBar: AppBar(
        title: Text("Single Scroll View Say8"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 91, 255, 236),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        // reverse: true,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(color: Colors.red, height: 400, width: 200),
                  Container(color: Colors.amberAccent, height: 300, width: 200),
                  Container(color: Colors.blue, height: 500, width: 200),
                ],
              ),
            ),
            Container(color: Colors.red, height: 400, width: 200),
            Container(color: Colors.amberAccent, height: 300, width: 200),
            Container(color: Colors.blue, height: 500, width: 200),
          ],
        ),
      ),
    );
  }
}
