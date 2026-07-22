import 'package:flutter/material.dart';

class SpacerDay6 extends StatelessWidget {
  const SpacerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expander day 6"),
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.pink)),
                Spacer(), // meberikan spasi seimbang
                Expanded(child: Container(color: Colors.blue)),
              ],
            ),
          ),
          SizedBox(height: 10), // memberikan spasi antara row dan column
          Expanded(
            child: Container(
              // margin: EdgeInsets.all(20),
              color: Colors.pink,
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5, // memberikan perbandingan dengan komponen lain
            child: Container(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
