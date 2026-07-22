import 'package:flutter/material.dart';

class ImageDay6 extends StatelessWidget {
  const ImageDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iMAge ConTaINer dAy 6"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 810,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/absen.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}