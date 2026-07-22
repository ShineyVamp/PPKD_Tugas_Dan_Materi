import 'package:flutter/material.dart';

class ExpanderDay6 extends StatelessWidget {
  const ExpanderDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expander day 6"),
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              // margin: EdgeInsets.all(20),
              color: Colors.pink,
            ),
          ),
          Expanded(
            // flex: 5,
            child: Container(
              color: Colors.blue,
            ),
          )         
        ],
      ),
    );
  }
}