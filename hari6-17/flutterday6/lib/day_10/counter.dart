import 'package:flutter/material.dart';

class CounterDay10State extends StatefulWidget {
  const CounterDay10State({super.key});

  @override
  State<CounterDay10State> createState() => _CounterDay10StateState();
}

class _CounterDay10StateState extends State<CounterDay10State> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counter.toString(), style: TextStyle(fontSize: 100)),
            ],
          ),
        ],
      ),
    );
  }
}
