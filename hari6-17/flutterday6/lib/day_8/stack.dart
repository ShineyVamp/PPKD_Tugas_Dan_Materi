import 'package:flutter/material.dart';

class StackDay8 extends StatelessWidget {
  const StackDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9E8A2),
      appBar: AppBar(
        title: Text("StackDay8"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 91, 255, 236),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                height: 400,
                width: 400,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                height: 300,
                width: 300,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  shape: BoxShape.circle,
                ),
                height: 200,
                width: 200,
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                height: 400,
                width: 400,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                height: 300,
                width: 300,
              ),
              Positioned(
                top: -100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    shape: BoxShape.circle,
                  ),
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
